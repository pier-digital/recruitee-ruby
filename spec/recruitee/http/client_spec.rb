# frozen_string_literal: true

require 'spec_helper'

describe Recruitee::HTTP::Client do
  subject(:client) { described_class.new(recruitee) }

  let(:company_id) { Faker::Lorem.characters(number: 10) }
  let(:api_token) { Faker::Lorem.characters(number: 40) }
  let(:recruitee) { Recruitee::Client.new(company_id, api_token) }

  describe '#request' do
    it 'prefixes the path with the company id' do
      stub_request(:get, api_url('/example'))
        .to_return(status: 200, body: '', headers: {})

      client.request(:get, '/example')
    end

    it 'sets the authorization header from the recruitee client' do
      stub_request(:get, api_url('/example'))
        .with(headers: { 'Authorization': /#{Regexp.quote(api_token)}/ })
        .to_return(status: 200, body: '', headers: {})

      client.request(:get, '/example')
    end

    it "does not send a query string when one isn't provided" do
      stub_request(:get, api_url('/example'))
        .with(query: nil)
        .to_return(status: 200, body: '', headers: {})

      client.request(:get, '/example')
    end

    it 'sends a query string when params are provided' do
      stub_request(:get, api_url('/example'))
        .with(query: { foo: 'bar' })
        .to_return(status: 200, body: '', headers: {})

      client.request(:get, '/example', params: { foo: 'bar' })
    end

    it "does not send a request body when one isn't provided" do
      stub_request(:post, api_url('/example'))
        .with(body: '')
        .to_return(status: 200, body: '', headers: {})

      client.request(:post, '/example')
    end

    it 'sends the request body as JSON when one is provided' do
      stub_request(:post, api_url('/example'))
        .with(body: { foo: 'bar' }.to_json)
        .to_return(status: 200, body: '', headers: {})

      client.request(:post, '/example', body: { foo: 'bar' })
    end
  end

  private

  def api_url(path)
    "https://api.recruitee.com/c/#{company_id}#{path}"
  end
end
