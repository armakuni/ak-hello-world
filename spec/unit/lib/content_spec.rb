require 'spec_helper'
require 'content'

describe Content do
  subject(:content) { described_class.new }

  describe '.generate' do
    it 'returns "Hello World"' do
      expect(content.generate).to eq 'Hello World'
    end
  end
end
