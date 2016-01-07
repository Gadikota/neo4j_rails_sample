class LocationsController < ApplicationController
  def create
  end

  def import
    @location = Location.import permitted_attributes(Location.new)
    authorize Location.new
    if @location
      redirect_to action: :index
    else
      flash[:error] = "Unable to import"
      redirect_to action: :index
    end
  end

  def index
    @location = Location.new if policy(:location).import?
    @locations = policy_scope(Location)
  end
end
