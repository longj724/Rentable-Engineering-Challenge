class ImportPropertiesJob < ApplicationJob
  queue_as :default

  def perform()
    PropertyFeedParser.import_properties
  end
end
