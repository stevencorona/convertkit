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

    def forms()
      raw   = get_request("/forms")
      forms = []

      raw.each do |raw_form|
        form = ConvertKit::Form.new(raw_form["id"])
        form.load(raw_form, self)

        forms << form
      end

      forms
    end

    private 

    def get_request(url)
      json = self.class.get("#{@uri}/#{url}?k=#{@key}&v=#{@version}")
      JSON.parse(json.body)
    end

  end
end