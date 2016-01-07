require 'csv'
class Location 
  extend Geocoder::Model::ActiveRecord
  include Neo4j::ActiveNode
  property :address, type: String
  property :latitude, type: Float
  property :longitude, type: Float

  attr_accessor :csv, :skip_gecode
  geocoded_by :address, unless: :skip_gecode
  after_validation :geocode, :if => 'address_changed? && !skip_gecode'

  class << self
    def import params
      # Import from csv
      csv = CSV.table(params[:csv].tempfile)
      return false unless csv.headers.include?(:locations)
      csv.each do |row|
        unless row[:locations].blank?
          5.times{
            l = Location.new address: row[:locations]
            l.valid?
            l.save if l.longitude.present? && l.latitude.present?
            sleep(1)
          }
        end
      end
    end
  end
end
