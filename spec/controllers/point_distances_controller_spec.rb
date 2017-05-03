require 'rails_helper'

RSpec.describe 'Poits Distances API', type: :request do
  
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

  # Test suite for POST /point_distances
  describe 'POST /point_distances' do
    let(:valid_attributes) { { distance: 15, origin_id: origin.id, destination_id: destination.id } }

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
        expect(response.body).to match(/{\"id\":null,\"distance\":null,\"origin_id\":null,\"destination_id\":null,\"created_at\":null,\"updated_at\":null}/)
      end
    end
  end
end
