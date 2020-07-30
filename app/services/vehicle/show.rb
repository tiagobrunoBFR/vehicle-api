module Services
  module Vehicle
    class Show

      def initialize(id:)
        @id = id
      end

      def call
        show_vehicle
      end

      private

      attr_reader :id

      def show_vehicle

        vehicle = ::Vehicle.find_by(id: id)

        if vehicle.blank?
          nil?
        else
          vehicle
        end
      end

    end
  end
end