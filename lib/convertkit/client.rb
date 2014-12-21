module ConvertKit
  class Client

    attr_reader :key, :uri, :version

    def initialize(key, uri="https://api.convertkit.com")
      @key     = key
      @uri     = uri
      @version = 2
    end

    def form(id)
      ConvertKit::Form.new(id)
    end

    def forms()
      raw   = get("/forms")
      forms = []

      raw.each do |form|
        forms << ConvertKit::Form.load(form)
      end

      forms
    end

  end
end