# frozen_string_literal: true

module Recruitee
  module HTTP
    class Client
      attr_reader :recruitee, :options, :prefix

      DEFAULT_DOMAIN = 'https://api.recruitee.com'

      def initialize(recruitee, options = {})
        raise ArgumentError if recruitee.nil?

        @recruitee = recruitee
        @prefix    = options[:prefix] || "/c/#{@recruitee.company_id}"
        @options   = options
      end

      def request(method, path, params: nil, body: nil, headers: {})
        res = connection.send(method.downcase.to_sym, prefixed(path)) do |req|
          req.body = body unless body.nil?
          req.params = params unless params.nil?
          req.headers = default_headers.merge(headers)
        end

        Recruitee::Response.new(res.status, res.body, headers: res.headers)
      end

      private

      def default_headers
        {
          'Accept-Charset': 'utf-8',
          'Authorization': "Bearer #{@recruitee.api_token}",
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      end

      def domain
        options[:domain] || DEFAULT_DOMAIN
      end

      def connection
        @_connection ||= Faraday.new(url: domain, ssl: { verify: true }) do |f|
          f.options.params_encoder = Faraday::FlatParamsEncoder
          f.request :json
          f.request :url_encoded
          f.response :logger if options[:debug]
          f.adapter Faraday.default_adapter
        end
      end

      def prefixed(path)
        "#{prefix}#{path}"
      end
    end
  end
end
