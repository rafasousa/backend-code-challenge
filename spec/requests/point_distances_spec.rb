require 'rails_helper'

RSpec.describe 'Poits Distances API', type: :request do
  # Initialize the test data
  let!(:origin) { create(:point) }
  let!(:destination) { create(:point) }
  let!(:distances) { create_list(:point_distance, 20, distance: 20, origin_id: origin.id, destination_id: destination.id) }
  let(:id) { distances.first.id }

  # Test suite for GET /point_distances
  describe 'GET /point_distances' do
    before { get "/point_distances" }

    context 'when point_distances exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all point distances' do
        expect(json.size).to eq(20)
      end
    end

  end

  # Test suite for GET /point_distances/:id
  describe 'GET /point_distances/:id' do
    before { get "/point_distances/#{id}" }

    context 'when point item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when point item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PointDistance with 'id'=0/)
      end
    end
  end

  # Test suite for PUT /point_distances
  describe 'POST /point_distances' do
    let(:valid_attributes) { { origin_id: 1, destination_id: 2 } }

    context 'when request attributes are valid' do
      before { post "/point_distances", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/point_distances", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Origin must exist, Origin can't be blank, Destination must exist, Destination can't be blank, Distance can't be blank/)
      end
    end
  end

  # Test suite for PUT /point_distances/:id
  describe 'PUT /point_distances/:id' do
    let(:valid_attributes) { { origin_id: 2 } }

    before { put "/point_distances/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = PointDistance.find(id)
        expect(updated_item.distance).to match(20)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find PointDistance with 'id'=0/)
      end
    end
  end

  # Test suite for DELETE /points/:id
  describe 'DELETE /point_distances/:id' do
    before { delete "/point_distances/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end