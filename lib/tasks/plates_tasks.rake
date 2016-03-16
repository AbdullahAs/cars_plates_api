namespace :plates do
  desc 'fetch new plates from moi.gov.sa'
  task fetch: :environment do
    FetchPlates.new().start
  end

  desc 'just after plate is sold, update its status'
  task sold: :environment do
    ManipulatePlates.new().sold
  end

  desc 'set english letters'
  task letters: :environment do
    ManipulatePlates.new().letters
  end
end
