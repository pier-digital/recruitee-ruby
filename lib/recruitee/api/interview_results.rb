# frozen_string_literal: true

module Recruitee
  module API
    class InterviewResults < APIResource
      def initialize(client)
        super(client, InterviewResult)
      end

      def create(candidate_id:, **interview_result)
        payload = request(
          :post,
          "/interview/candidates/#{candidate_id}/results",
          body: { interview_result: interview_result }
        )

        initialize_from(payload[resource_name])
      end

      def resource_url
        '/interview/results'
      end
    end
  end
end
