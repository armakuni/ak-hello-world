require 'api'
require 'spec_helper'
require 'rack/test'

describe 'The HelloWorld App', acceptance: true do
  include Rack::Test::Methods

  def app
    HelloWorld::API
  end

  it 'returns Hello World' do
    get '/'
    expected_message = { message: 'Hello world' }.to_json
    expect(last_response).to be_ok
    expect(last_response.body).to eq(expected_message)
  end
end
