class Location 
  extend Geocoder::Model::ActiveRecord
  include Neo4j::ActiveNode
  property :address, type: String
  property :latitude, type: Float
  property :longitude, type: Float


  geocoded_by :address
  after_validation :geocode
  after_validation :geocode, :if => :address_changed?
end
