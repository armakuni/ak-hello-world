require 'sinatra/base'
require 'content'
require 'logger'

module HelloWorld
  class API < Sinatra::Base
    helpers do
      def content
        Content.new
      end
    end

    def logger
      @logger ||= begin
        logger = Logger.new(STDOUT)
        logger.level = Logger::INFO
        logger
      end
    end

    before do
      content_type 'application/json'
    end

    get '/' do
      logger.info 'Hello World'
      { message: content.generate }.to_json
    end
  end
end
