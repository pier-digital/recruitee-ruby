# frozen_string_literal: true

module Recruitee
  class Placement < Resource
    def candidate
      @_candidate ||= client.candidates.find(candidate_id)
    end

    def offer
      @_offer ||= client.offers.find(offer_id)
    end
  end
end
