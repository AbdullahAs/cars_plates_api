class ManipulatePlates

  def sold
    plates = Plate.last(50)
    plates.each do |plate|
      plate.check_availability
    end
    puts 'plates:sold task was executed sucessfuly'
  end

  def letters

    puts 'plates:letters task was executed sucessfuly'
  end
end