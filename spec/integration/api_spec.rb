require 'api'
require 'spec_helper'
require 'rack/test'
require 'logger'

describe 'The HelloWorld App', integration: true do
  include Rack::Test::Methods

  def app
    HelloWorld::API
  end

  describe 'API' do
    describe '/' do
      let(:logger) { double(info: '') }

      before do
        allow_any_instance_of(app).to receive(:logger)
          .and_return(logger)
      end

      it 'returns Hello World' do
        get '/'
        expected_message = { message: 'Hello World' }.to_json

        expect(last_response).to be_ok
        expect(last_response.body).to eq(expected_message)
      end

      it 'logs Hello World' do
        expect(logger).to receive(:info).with('Hello World')
        get '/'
      end
    end
  end
end
