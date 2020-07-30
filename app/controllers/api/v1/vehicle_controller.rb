module Api
  module V1
    class VehicleController < ApplicationController

      def create

        begin
          vehicle = vehicle_service_create
          if vehicle.errors.blank?

            render status: 201, json: { data: vehicle }
          else
            render status: 422, json: { data: vehicle.errors.messages }
          end
        rescue
          render status: 400, json: { data: 'Bad Request' }
        end
      end

      def vehicle_service_create
        ::Services::Vehicle::Create.new(params: vehicle_params).call
      end

      def vehicle_params

        params.require(:vehicle).permit(
          :brand,
          :vehicle,
          :year,
          :sold,
          :description
        )
      end

    end
  end
end
