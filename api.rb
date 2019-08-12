require 'sinatra/base'
require 'content'

module HelloWorld
  class API < Sinatra::Base
    helpers do
      def content
        Content.new
      end
    end

    before do
      content_type 'application/json'
    end

    get '/' do
      { message: content.generate }.to_json
    end
  end
end
