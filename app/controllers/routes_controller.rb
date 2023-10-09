class RoutesController < ApplicationController
    def generate_routes
      home_location = Location.find_by(category: 'home', user_id: params[:user_id])
      work_location = Location.find_by(category: 'work', user_id: params[:user_id])
  
      if home_location && work_location
        google_maps = GoogleMapsService::Client.new
  
        routes = google_maps.directions(
          "#{home_location.latitude},#{home_location.longitude}",
          "#{work_location.latitude},#{work_location.longitude}",
          mode: 'driving',
          alternatives: true
        )
  
        render json: routes, status: :ok
      else
        render json: { error: "Home or work location not found for the user" }, status: :not_found
      end
    end
  end
  