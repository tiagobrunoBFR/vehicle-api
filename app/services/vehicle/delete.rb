module Services
  module Vehicle
    class Delete

      def initialize(id:)
        @id = id
      end

      def call
        delete_vehicle
      end

      private

      attr_reader :id

      def delete_vehicle

        vehicle = ::Vehicle.find_by(id: id)

        if vehicle.blank?
          nil?
        else
          vehicle.delete
        end
      end

    end
  end
end