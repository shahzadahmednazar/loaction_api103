class LocationsController < ApplicationController
	before_action :set_user

  def create
    @location = @user.locations.new(location_params)

    if @location.save
      render json: @location, status: :created
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def location_params
    params.require(:location).permit(:category, :latitude, :longitude, :address)
  end
end
