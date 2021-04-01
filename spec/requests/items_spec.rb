# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  # Seed test data
  let!(:items) { create_list(:item, 5) }
  let(:item_id) { items.first.id }

  # Test the GET endpoint for /items
  describe 'GET /items' do
    before { get '/items' } # Hit the endpoint

    it 'returns all items' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test the GET endpoint for /items/:id
  describe 'GET /items/:id' do
    before { get "/items/#{item_id}" }

    context 'when the record exists' do
      it 'returns the item' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 200 }

      it 'returns status code 404 and a human-readable error message' do
        expect(response).to have_http_status(404)
        expect(response.body).to match(/Couldn't find Item with that id/)
      end
    end
  end

  # Test the PUT endpoint for /items/:id
  describe 'PUT /items' do
    let(:item_attributes) { { name: 'Purple Rain' } }

    context 'when the request is valid' do
      before { put '/items', params: item_attributes }

      it 'creates a item' do
        expect(JSON.parse(response.body)['name']).to eq('Purple Rain')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { put '/items', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
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