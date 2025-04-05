namespace :properties do
  desc "Import properties from XML feed"
  task import: :environment do
    count = PropertyFeedParser.import_properties
    puts "Imported #{count} properties from feed"
  end
end