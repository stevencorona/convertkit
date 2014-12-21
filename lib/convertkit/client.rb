module ConvertKit
  class Client

    attr_reader :key, :uri, :version

    def initialize(key, uri="https://api.convertkit.com")
      @key     = key
      @uri     = uri
      @version = 2
    end

  end
end