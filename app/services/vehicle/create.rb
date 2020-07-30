module Services
  module Vehicle
    class Create

      def initialize(params:)
        @brand = params[:brand]
        @vehicle = params[:vehicle]
        @year = params[:year]
        @sold = params[:sold]
        @description = params[:description]
      end

      def call
        create_vehicle
      end

      private

      attr_reader :brand, :vehicle, :year, :sold, :description

      def create_vehicle

        result = ::Vehicle.new(
          brand: brand,
          vehicle: vehicle,
          year: year,
          sold: sold,
          description: description
        )
        result.save
        result
      end

    end
  end
end
