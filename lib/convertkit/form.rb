module ConvertKit
  class Form

    attr_reader :id, :subscriber_count, :title, :description, :name, :details, :embed, :success_msg, :button_msg, :created_at, :updated_at
    attr_writer :client

    def self.find(id, client)
      raw  = client.get_request("/forms/#{id}")
      form = ConvertKit::Form.new(id, client)
      form.load(raw, client)

      form
    end

    def load(data, client)
      @client = client

      @id               = data["id"]
      @name             ||= data["name"]
      @title            ||= data["title"]
      @description      ||= data["description"]
      @subscriber_count ||= data["subscriber_count"]
      @name             ||= data["name"]
      @details          ||= data["details"]
      @embed            ||= data["embed"]
      @success_msg      ||= data["success_msg"]
      @button_msg       ||= data["button_msg"]
      @created_at       ||= data["created_at"]
      @updated_at       ||= data["updated_at"]
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
        form = ConvertKit::Form.new(raw_form["id"], self)
        form.load(raw_form, self)

        forms << form
      end

      forms
    end
  end
  
end