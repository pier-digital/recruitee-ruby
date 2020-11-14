# frozen_string_literal: true

module Recruitee
  module API
    class Offers < APIResource
      def initialize(client)
        super(client, Offer)
      end
    end
  end
end
