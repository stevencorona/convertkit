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
    
    def initialize(id, client)
      @id     = id
      @client = client
    end

    def subscribe(params)
      opts = {email: nil, fname: nil, course_opted: true}.merge(params)
      @client.post_request("/forms/#{@id}/subscribe", opts)
    end

  end

  class Client
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
  end
  
end