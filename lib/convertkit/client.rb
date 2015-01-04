require 'httparty'

module ConvertKit

  class Client
    include HTTParty

    attr_reader :key, :uri, :version

    def initialize(key, uri="https://api.convertkit.com")
      @key     = key
      @uri     = uri
      @version = 2
    end

    def form(id)
      form = ConvertKit::Form.new(id)
      form.client = self

      form
    end

    def get_request(path)
      json = self.class.get("#{@uri}#{path}?k=#{@key}&v=#{@version}")
      JSON.parse(json.body)
    end

    def post_request(path, params)

      url = "#{@uri}#{path}"

      json = self.class.post(url, body: {
        k: @key,
        v: @version,
        }.merge(params))
      
      JSON.parse(json.body)
    end

  end
end