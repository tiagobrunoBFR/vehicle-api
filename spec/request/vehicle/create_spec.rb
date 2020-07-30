require 'rails_helper'

describe 'Api::V1::VehicleController', type: :request do

  before do
    execute_actions
  end

  let(:url) do
    '/api/v1/vehicles'
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

  describe 'POST /vehicles' do

    context 'When parms is valid' do
      let(:execute_actions) do
        post url, params: { vehicle: valid_params }
      end


      it 'should return status code 201' do
        expect(response.status).to be 201
      end

      it 'should return vehicle registered' do

        body = JSON.parse response.body

        expect(body['data']['brand']).to eq valid_params[:brand]
        expect(body['data']['vehicle']).to eq valid_params[:vehicle]
        expect(body['data']['year']).to eq valid_params[:year]
        expect(body['data']['sold']).to eq valid_params[:sold]
        expect(body['data']['description']).to eq valid_params[:description]
      end

      context 'When is generated an error' do

        before do
          post url
        end

        it 'should return status code 400' do
          expect(response.status).to be 400
        end

        it 'should return message Bad Request' do
          body = JSON.parse response.body
          expect(body['data']).to eq 'Bad Request'
        end

      end

      context 'When params is invalid' do

        it 'should return message can\'t be blank when brand is nil' do

          post url, params: { vehicle: params_brand_is_blank }
          body = JSON.parse response.body

          expect(body['data']['brand'][0]).to eq 'can\'t be blank'

        end

        it 'should return message can\'t be blank when vehicle is nil' do

          post url, params: { vehicle: params_vehicle_is_blank }
          body = JSON.parse response.body

          expect(body['data']['vehicle'][0]).to eq 'can\'t be blank'

        end

        it 'should return message can\'t be blank when sold is nil' do

          post url, params: { vehicle: params_sold_is_blank }
          body = JSON.parse response.body

          expect(body['data']['sold'][0]).to eq 'can\'t be blank'

        end

      end

    end
  end
end

