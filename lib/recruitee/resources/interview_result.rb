# frozen_string_literal: true

module Recruitee
  class InterviewResult < Resource
    def admin
      @_admin ||= client.admins.find(admin_id)
    end

    def candidate
      @_candidate ||= client.candidates.find(candidate_id)
    end
  end
end
