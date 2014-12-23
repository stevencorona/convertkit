module ConvertKit
  class Form

    attr_reader :id
    attr_writer :client

    def self.load(json, client)
      @client = client
    end
    
    def initialize(id)
      @id = id
    end

    def subscribe(opts)
      default = {email: nil, fname: nil, course_opted: true}
    end

  end
end