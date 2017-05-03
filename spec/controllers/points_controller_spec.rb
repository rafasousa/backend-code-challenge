require 'rails_helper'

RSpec.describe 'Points API', type: :request do
  
  let!(:points) { create_list(:point, 10) }
  let(:point_id) { points.first.id }

  # Test suite for GET /points
  describe 'GET /points' do
    before { get '/points' }

    it 'returns points' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /points/:id
  describe 'GET /points/:id' do
    before { get "/points/#{point_id}" }

    context 'when the record exists' do
      it 'returns the point' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(point_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:point_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Point/)
      end
    end
  end

  # Test suite for POST /points
  describe 'POST /points' do
    
    let(:valid_attributes) { { name: 'Learn Elm' } }

    context 'when the request is valid' do
      before { post '/points', params: valid_attributes }

      it 'creates a point' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/points', params: { name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /points/:id
  describe 'PUT /points/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/points/#{point_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /points/:id
  describe 'DELETE /points/:id' do
    before { delete "/points/#{point_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
