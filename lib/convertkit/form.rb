module ConvertKit
  class Form

    attr_reader :id

    def self.load(json)
    end
s
    def initialize(id)
      @id = id
    end

    def subscribe(opts)
      default = {email: nil, fname: nil, course_opted: true}
    end

  end
end