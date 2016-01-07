require 'csv'
class Location 
  extend Geocoder::Model::ActiveRecord
  include Neo4j::ActiveNode
  property :address, type: String
  property :latitude, type: Float
  property :longitude, type: Float

  attr_accessor :csv
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  class << self
    def import params
      # Import from csv
      csv = CSV.table(params[:csv].tempfile)
      return false unless csv.headers.include?(:locations)
      csv.each do |row|
        Location.create address: row[:locations]
      end
    end
  end
end
