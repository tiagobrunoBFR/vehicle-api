module Services
  module Vehicle
    class Update

      def initialize(id:, params:)
        @brand = params[:brand]
        @vehicle = params[:vehicle]
        @year = params[:year]
        @sold = params[:sold]
        @description = params[:description]
        @id = id
      end

      def call
        update_vehicle
      end

      private

      attr_reader :brand, :vehicle, :year, :sold, :description, :id

      def update_vehicle

        vehicle = ::Vehicle.find_by(id: id)

        if vehicle.blank?
          nil?
        else
          vehicle.update(vehicle_params)
          vehicle
        end
      end

      def vehicle_params
        {
          brand: brand,
          vehicle: vehicle,
          year: year,
          sold: sold,
          description: description
        }
      end

    end
  end
end