# frozen_string_literal: true

module Recruitee
  module API
    class Placements < APIResource
      undef_method :find
      undef_method :list
      undef_method :update

      def initialize(client)
        super(client, Placement)
      end

      private

      def namespaced_body(data)
        data
      end
    end
  end
end
