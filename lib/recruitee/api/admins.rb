# frozen_string_literal: true

module Recruitee
  module API
    class Admins < APIResource
      undef_method :find
      undef_method :create
      undef_method :update
      undef_method :destroy

      def initialize(client)
        super(client, Admin)
      end

      def current
        payload = request(:get, '/admin')

        initialize_from(payload[resource_name])
      end
    end
  end
end
