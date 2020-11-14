# frozen_string_literal: true

module Recruitee
  module API
    class InterviewEvents < APIResource
      def initialize(client)
        super(client, InterviewEvent)
      end

      def create(candidate_id:, **interview_event)
        payload = request(
          :post,
          "/interview/candidates/#{candidate_id}/events",
          body: { interview_event: interview_event }
        )

        initialize_from(payload[resource_name])
      end

      def schedule(id, data = {})
        body = namespaced_body(data)
        payload = request(:post, "#{resource_url}/#{id}/schedule", body: body)

        initialize_from(payload[resource_name])
      end

      def resource_url
        '/interview/events'
      end
    end
  end
end
