module ConvertKit
  class Form

    attr_reader :id, :subscriber_count, :name, :details, :embed, :created_at, :updated_at
    attr_writer :client

    def load(data, client)
      @client = client

      @id               = data["id"]
      @subscriber_count = data["subscriber_count"]
      @name             = data["name"]
      @details          = data["details"]
      @embed            = data["embed"]
      @created_at       = data["created_at"]
      @updated_at       = data["updated_at"]
    end
    
    def initialize(id)
      @id = id
    end

    def subscribe(opts)
      default = {email: nil, fname: nil, course_opted: true}
    end

  end
end