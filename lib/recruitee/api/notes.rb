# frozen_string_literal: true

module Recruitee
  module API
    class Notes < APIResource
      def initialize(client)
        super(client, Note)
      end

      def list(candidate_id:, **notes)
        payload = request(:get, "/candidates/#{candidate_id}/notes")

        payload["#{resource_name}s"].map { |props| initialize_from(props) }
      end

      def resource_url
        '/interview/results'
      end
    end
  end
end
