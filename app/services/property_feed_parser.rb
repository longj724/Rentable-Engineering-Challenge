require 'nokogiri'
require 'open-uri'

class PropertyFeedParser
  def self.parse
    sample_feed_path = Rails.root.join('lib', 'data', 'sample_abodo_feed.xml')
    
    doc = Nokogiri::XML(URI.open(sample_feed_path))
    
    properties = []
    
    doc.xpath('//Property').each do |property|
      city = property.xpath('./PropertyID/Address/City').text
      
      next unless city.downcase == 'madison'
      
      property_id = property.xpath('./PropertyID/Identification/@IDValue').text
      name = property.xpath('./PropertyID/MarketingName').text
      email = property.xpath('./PropertyID/Email').text

      total_bedrooms = 0
      property.xpath('./Floorplan').each do |floorplan|
        bedroom_count = floorplan.xpath('./Room[@RoomType="Bedroom"]/Count').text.to_f
        unit_count = floorplan.xpath('./UnitCount').text.to_i
        total_bedrooms += bedroom_count * unit_count
      end
      
      properties << {
        property_id: property_id,
        name: name,
        email: email,
        bedrooms: total_bedrooms
      }
    end
    
    properties
  end
  
  def self.import_properties
    properties = parse
    new_properties = []
    
    properties.each do |property_data|
      property = Property.find_or_create_by(property_id: property_data[:property_id]) do |p|
        p.name = property_data[:name]
        p.email = property_data[:email]
        p.bedrooms = property_data[:bedrooms]
        new_properties << p
      end
    end
    
    new_properties
  end
end