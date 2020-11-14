# frozen_string_literal: true

module Recruitee
  class Response
    attr_accessor :status_code, :body, :headers

    def initialize(status_code, body, headers: nil)
      body = '{}' if !body || body.empty?

      @status_code = status_code
      @headers = headers ? headers.to_hash : {}
      @body = JSON.parse(body)
    end

    def to_s
      "[#{status_code}] #{body}"
    end
  end
end
