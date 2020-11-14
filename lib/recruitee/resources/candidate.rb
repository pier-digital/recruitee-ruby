# frozen_string_literal: true

module Recruitee
  class Candidate < Resource
    def interview_events
      @_interview_events ||= client.interview_events.list(candidate_id: id)
    end

    def interview_results
      @_interview_results ||= client.interview_results.list(candidate_id: id)
    end
    alias evaluations interview_results

    def offers
      @_offers ||= placements.map(&:offer)
    end

    def placements
      @_placements ||= @properties[:placements].map do |attrs|
        Placement.new(client, attrs)
      end
    end
  end
end
