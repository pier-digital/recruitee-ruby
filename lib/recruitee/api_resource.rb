# frozen_string_literal: true

module Recruitee
  class APIResource
    attr_reader :client, :resource_klass

    def initialize(client, resource_klass)
      if client.nil? || resource_klass.nil?
        raise ArgumentError, 'client & resource class must be provided'
      end

      @client = client
      @resource_klass = resource_klass
    end

    def create(data = {})
      body = namespaced_body(data)
      payload = request(:post, resource_url, body: body)

      initialize_from(payload[resource_name])
    end

    def destroy(id, params = {})
      payload = request(:delete, "#{resource_url}/#{id}", params: params)

      initialize_from(payload[resource_name])
    end

    def find(id, params = {})
      payload = request(:get, "#{resource_url}/#{id}", params: params)

      initialize_from(payload[resource_name])
    end

    def list(params = {})
      payload = request(:get, resource_url, params: params)

      payload["#{resource_name}s"].map { |props| initialize_from(props) }
    end

    def update(id, data = {})
      body = namespaced_body(data)
      payload = request(:patch, "#{resource_url}/#{id}", body: body)

      initialize_from(payload[resource_name])
    end

    def resource_name
      Util.underscore(resource_klass.name.split('::').last)
    end

    def resource_url
      "/#{resource_name}s"
    end

    private

    def initialize_from(properties)
      resource_klass.new(client, properties)
    end

    def namespaced_body(data)
      data[resource_name.to_sym] ? data : { "#{resource_name}": data }
    end

    def request(*args)
      response = client.request(*args)

      if response.status_code < 200 || response.status_code >= 400
        raise response.to_s
      end

      response.body
    end
  end
end
