
require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new location' do
        user = User.create(name: 'Test User')  # Create a user instance directly

        post :create, params: { user_id: user.id, location: { category: 'home', latitude: 123.456, longitude: -78.901, address: '123 Main St' } }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable_entity status' do
        user = User.create(name: 'Test User')  # Create a user instance directly

        post :create, params: { user_id: user.id, location: { category: 'home', latitude: 123.456, longitude: -78.901 } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
