require 'rails_helper'

describe 'Api::V1::VehicleController', type: :request do

  before do
    execute_actions
  end

  let(:vehicle) do
    create(:vehicle)
  end

  let(:url) do
    '/api/v1/vehicles'
  end

  describe 'GET /vehicles/:id' do

    context 'When vehicle is found' do
      let(:execute_actions) do
        get "#{url}/#{vehicle.id}"
      end


      it 'should return status code 200' do
        expect(response.status).to be 200
      end

      it 'should return a vehicle requested by id' do

        body = JSON.parse response.body

        expect(body['data']['brand']).to match(vehicle[:brand])
      end

    end

    context 'When vehicle is not found' do
      let(:execute_actions) do
        get "#{url}/100"
      end

      it 'should return status code 404' do
        expect(response.status).to be 404
      end

      it 'should return message not found' do
        body = JSON.parse response.body
        expect(body['data']).to eq 'Not Found'
      end

    end

  end

end