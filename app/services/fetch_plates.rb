class FetchPlates

  def start
    @log = ActiveSupport::Logger.new('log/FetchPlates.log')
    @log.info "#{Time.now} : Starting fetch plates process"
    start_time = Time.now
    main
    end_time = Time.now
    duration = (end_time  - start_time) / 1.seconds
    @log.info "task started at: #{start_time},
    finished at #{end_time},
    and last #{duration} seconds"
    @log.close
    puts 'Fetch Plates task was executed sucessfuly'
  end

  def main
    response = parse_response
    plates = get_data(response)
    update_db(plates) unless is_plate_already_esists? plates[:date]
  rescue Exception => e
    @log.info "ERROR in main task: #{e}"
  end

  # call the Gov.com.sa site to get the latest plates and parse the HTML
  def parse_response
    tries ||= 3
    response = Nokogiri::HTML(HTTP.get(ENV['gov_com_sa_url']).to_s)
    plates = response.css('div#contentspan')[0].css('tr')
  rescue Exception => e
    @log.info "ERROR in parse_response: #{e}"
    retry unless (tries -= 1).zero?
  else
    @log.info "#{Time.now} : responde from gov.com.sa successfuly received"
    plates
  end

  # extract the data from the HTML and pass it as a Hash
  def get_data(plates)
    plateNumber = 1
    plates_hash = {}
    plates_hash[:date] = (Date.parse(plates[5].css('td')[4].text.gsub!("هـ", ""))).to_greg
    plates.each do |plate|
      plateNumber += 1
      n = [1,2] # skip the empty cells
      next if n.include? plateNumber
      letters_ar = plate.css('td')[0].text
      numbers = plate.css('td')[1].text
      min_price = plate.css('td')[2].text
      bid_date_hejri = Date.parse(plate.css('td')[4].text.gsub!("هـ", ""))
      bid_date_greg = bid_date_hejri.to_greg
      plates_hash["plate_#{plateNumber-2}"] =  {
                          letters_ar: letters_ar,
                          numbers: numbers,
                          min_price: min_price,
                          bid_date_hejri: bid_date_hejri,
                          bid_date_greg: bid_date_greg }
    end
  rescue Exception => e
    @log.info "ERROR in get_data: #{e}"
  else
    @log.info "#{Time.now} : plates deatils successfuly parsed into a hash"
    @log.info "#{plates_hash}"
    plates_hash
  end

  # chech if the plates already added to DB
  def is_plate_already_esists?(date)
    if Plate.last.bid_date_greg == Date.parse(date)
      @log.info "#{Time.now} : plates list already exsists in DB, so I ignored it"
      true
    end
  end

  # update DB with the new plates
  def update_db(hash)
    hash.each do |key, value|
      Plate.create( letters_ar: value[:letters_ar],
                    numbers: value[:numbers],
                    min_price: value[:min_price],
                    bid_date_hejri: value[:bid_date_hejri],
                    bid_date_greg: value[:bid_date_greg])
    end
    @log.info "#{Time.now} : DB sucessfuly updated"
  end
end