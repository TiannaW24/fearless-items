# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  # Seed test data
  let!(:items) { create_list(:item, 5) }
  let(:item_id) { items.first.id }

  # Test the GET endpoint for /items
  describe 'GET /items' do
    before { get '/items' } # Hit the endpoint

    it 'returns all items and a 200' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
      expect(response).to have_http_status(200)
    end
  end

  # Test the GET endpoint for /items/:id
  describe 'GET /items/:id' do
    before { get "/items/#{item_id}" }

    context 'when the record exists' do
      it 'returns the item and a 200' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(item_id)
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 200 }

      it 'returns status code 404 and a human-readable error message' do
        expect(response).to have_http_status(404)
        expect(response.body).to match("{\"message\":\"Couldn't find Item with 'id'=#{200}\"}")
      end
    end
  end

# Test the POST endpoint for /items
describe 'POST /items' do
    context 'when the request is valid' do
      before { post '/items', params: { name: 'Purple Rain'} }

      it 'creates an item and returns a 201' do
        expect(JSON.parse(response.body)['name']).to eq('Purple Rain')
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/items', params: { fake: 'Prince' } }

      it 'returns status code 422 and a human-readable error message' do
        expect(response).to have_http_status(422)
        expect(response.body).to match("{\"message\":\"Validation failed: Name can't be blank\"}")
      end
    end
  end

  # Test the PUT endpoint /items/:id
  describe 'PUT /items/:id' do
    let(:items_attributes) { { name: 'Prince' } }

    context 'when the record exists' do
      before { put "/items/#{item_id}", params: items_attributes }

      it 'updates the record and returns a 204' do
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test the DELETE endpoint for /items/:id
  describe 'DELETE /items/:id' do
    before { delete "/items/#{item_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end