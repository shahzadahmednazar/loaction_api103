require 'dotenv/load'
require 'google_maps_service'

GoogleMapsService.configure do |config|
  config.key = 'YOUR_API_KEY'
  config.retry_timeout = 20
  config.queries_per_second = 10
end

