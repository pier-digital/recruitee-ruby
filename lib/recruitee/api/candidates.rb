# frozen_string_literal: true

module Recruitee
  module API
    class Candidates < APIResource
      def initialize(client)
        super(client, Candidate)
      end

      def create(offers: [], **candidate)
        super({ offers: offers, candidate: candidate })
      end

      def find_by_email(email)
        hits = search_for(email)
        # Recruitee's search is very fuzzy, so we need to find the real match
        match = hits.find { |hit| hit['emails'].include?(email) }

        match ? find(match['id']) : nil
      end

      private

      def search_for(email)
        search = {
          query: email, limit: 100, only: 'candidates', with_emails: true
        }
        res = request(:get, '/search/new/quick', params: search)

        res.dig('candidates', 'hits')
      end
    end
  end
end
