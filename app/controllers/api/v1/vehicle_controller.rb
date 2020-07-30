module Api
  module V1
    class VehicleController < ApplicationController

      def update

        begin
          vehicle = vehicle_service_update

          if vehicle.blank?
            return render status: 404, json: { data: 'Not Found' }
          end
          vehicle.update(vehicle_params)
          if vehicle.errors.blank?

            render status: 200, json: { data: vehicle }
          else
            render status: 422, json: { data: vehicle.errors.messages }
          end
        rescue
          render status: 400, json: { data: 'Bad Request' }
        end

      end

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

      def destroy

        vehicle = vehicle_service_delete
        if vehicle.blank?
          return render status: 404, json: { data: 'Not Found' }
        end
        vehicle.delete

        render status: 204
      end

      def vehicle_service_delete
        ::Services::Vehicle::Delete.new(id: params[:id]).call
      end

      def vehicle_service_create
        ::Services::Vehicle::Create.new(params: vehicle_params).call
      end

      def vehicle_service_update
        ::Services::Vehicle::Update.new(id: params[:id], params: vehicle_params).call
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
