require 'rails_helper'

describe 'Api::V1::VehicleController', type: :request do

  before do
    execute_actions
  end

  let(:vehicle_id) do
    create(:vehicle).id
  end

  let(:params_brand_is_blank) do
    {
      brand: '',
      vehicle: Faker::Boolean.boolean,
      year: 2020,
      sold: Faker::Boolean.boolean,
      description: Faker::Name.name
    }
  end

  let(:params_vehicle_is_blank) do
    {
      brand: Faker::Name.name,
      vehicle: nil,
      year: 2020,
      sold: Faker::Boolean.boolean,
      description: Faker::Name.name
    }
  end

  let(:params_sold_is_blank) do
    {
      brand: Faker::Name.name,
      vehicle: Faker::Boolean.boolean,
      year: 2020,
      sold: nil,
      description: Faker::Name.name
    }
  end

  let(:valid_params) do
    {
      brand: Faker::Name.name,
      vehicle: Faker::Boolean.boolean,
      year: 2020,
      sold: Faker::Boolean.boolean,
      description: Faker::Name.name
    }
  end

  let(:url) do
    '/api/v1/vehicles'
  end

  describe 'PUT /vehicles/:id' do

    context 'When parms is valid' do
      let(:execute_actions) do
        put "#{url}/#{vehicle_id}", params: { vehicle: valid_params }
      end

      it 'should return status code 200' do

        expect(response.status).to be 200
      end

      it 'Should return updated object' do

        body_update = JSON.parse response.body
        expect(
          { brand: body_update['data']['brand'],
            vehicle: body_update['data']['vehicle'],
            year: body_update['data']['year'],
            sold: body_update['data']['sold'],
            description: body_update['data']['description']
          }
        ).to match(valid_params)

      end

      context 'When is generated an error' do

        before do
          put "#{url}/#{vehicle_id}"
        end

        it 'should return status code 400' do
          expect(response.status).to be 400
        end

        it 'should return message Bad Request' do
          body = JSON.parse response.body
          expect(body['data']).to eq 'Bad Request'
        end

      end

      context 'When vehicle is not found' do

        before do
          put "#{url}/100", params: { vehicle: valid_params }
        end

        it 'should return status code 404' do
          expect(response.status).to be 404
        end

        it 'should return message Not Found' do
          body = JSON.parse response.body
          expect(body['data']).to eq 'Not Found'
        end

      end

      context 'When params is invalid' do

        it 'should return message can\'t be blank when brand is nil' do

          put "#{url}/#{vehicle_id}", params: { vehicle: params_brand_is_blank }
          body = JSON.parse response.body

          expect(body['data']['brand'][0]).to eq 'can\'t be blank'

        end

        it 'should return message can\'t be blank when vehicle is nil' do

          put "#{url}/#{vehicle_id}", params: { vehicle: params_vehicle_is_blank }
          body = JSON.parse response.body

          expect(body['data']['vehicle'][0]).to eq 'can\'t be blank'

        end

        it 'should return message can\'t be blank when sold is nil' do

          put "#{url}/#{vehicle_id}", params: { vehicle: params_sold_is_blank }
          body = JSON.parse response.body

          expect(body['data']['sold'][0]).to eq 'can\'t be blank'

        end

      end


    end

  end

end