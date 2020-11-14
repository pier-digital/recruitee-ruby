# frozen_string_literal: true

require 'spec_helper'

describe Recruitee::Client do
  let(:company_id) { Faker::Lorem.characters(number: 10) }
  let(:api_token) { Faker::Lorem.characters(number: 40) }

  describe '#initialize' do
    it 'instantiates a valid Recruitee Client' do
      expect { described_class.new(company_id, api_token) }
        .not_to raise_error
    end

    it 'requires a valid company id' do
      expect { described_class.new(nil, api_token) }
        .to raise_error(ArgumentError)
    end

    it 'requires a valid api key' do
      expect { described_class.new(company_id, nil) }
        .to raise_error(ArgumentError)
    end
  end

  describe '#candidates' do
    subject(:client) { described_class.new(company_id, api_token) }

    it 'returns a candidate object' do
      expect(client.candidates).to be_kind_of(Recruitee::APIResource)
    end
  end
end
