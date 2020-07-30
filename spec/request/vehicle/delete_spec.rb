require 'rails_helper'

describe 'Api::V1::VehicleController', type: :request do

  before do
    execute_actions
  end

  let(:vehicle_id) do
    create(:vehicle).id
  end

  let(:url) do
    '/api/v1/vehicles'
  end

  describe 'DELETE /vehicles/:id' do

    context 'When vehicle is delete with success' do
      let(:execute_actions) do
        delete "#{url}/#{vehicle_id}"
      end

      it 'should return status code 204' do
        expect(response.status).to be 204
      end

    end

    context 'When vehicle is not found' do
      let(:execute_actions) do
        delete "#{url}/100"
      end

      it 'should return message not found' do
        body = JSON.parse response.body
        expect(body['data']).to eq 'Not Found'
      end

    end

  end

end