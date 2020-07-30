module Services
  module Vehicle
    class List

      def call
        list_vehicle
      end

      def list_vehicle

        ::Vehicle.all

      end
    end

  end
end
