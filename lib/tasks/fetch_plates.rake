namespace :app do
  desc 'fetch new plates from moi.gov.sa'
  task fetch_plates: :environment do
    FetchPlates.new().start
  end
end
