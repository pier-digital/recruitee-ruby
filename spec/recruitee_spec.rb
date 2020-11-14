# frozen_string_literal: true

require 'spec_helper'

describe Recruitee do
  it 'has no style guide or quality violations' do
    result = RuboCop::CLI.new.run(['--format', 'quiet'])
    expect(result).to eq(0)
  end
end
