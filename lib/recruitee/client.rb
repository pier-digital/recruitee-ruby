# frozen_string_literal: true

module Recruitee
  # The Recruitee API client class that acts as a container for basic
  # client authentication.
  class Client
    extend Forwardable

    attr_accessor :company_id, :api_token, :http_client

    def_delegators :http_client, :request

    def initialize(company_id, api_token, options = {})
      @company_id  = company_id
      @api_token   = api_token
      @http_client = HTTP::Client.new(self, options)

      validate!
    end

    def admins
      @_admins ||= API::Admins.new(self)
    end

    def candidates
      @_candidates ||= API::Candidates.new(self)
    end

    def interview_events
      @_interview_events ||= API::InterviewEvents.new(self)
    end

    def interview_results
      @_interview_results ||= API::InterviewResults.new(self)
    end
    alias evaluations interview_results

    def offers
      @_offers ||= API::Offers.new(self)
    end

    def placements
      @_placements ||= API::Placements.new(self)
    end

    private

    def validate!
      [:company_id, :api_token].each do |name|
        unless send(name)
          raise ArgumentError, "Error! Missing required #{name}."
        end
      end
    end
  end
end
