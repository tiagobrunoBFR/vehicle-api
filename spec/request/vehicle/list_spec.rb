require 'rails_helper'

describe 'Api::V1::VehicleController', type: :request do

  before do
    execute_actions
  end

  let(:vehicles) do
    create_list(:vehicle, 30)
  end

  let(:url) do
    '/api/v1/vehicles'
  end

  describe 'GET /vehicles' do

    context 'When vehicles are return' do
      let(:execute_actions) do
        vehicles
        get "#{url}"
      end

      it 'should return status code 200' do

        expect(response.status).to be 200
      end

      it 'should return 30 vehicles' do
        body = JSON.parse response.body

        expect(body['data'].count).to be 30
      end

    end

    context 'When vehicles are empty' do
      let(:execute_actions) do
        get "#{url}"
      end

      it 'should return a array empty' do
        body = JSON.parse response.body

        expect(body['data'].count).to be 0
      end

    end

  end

end