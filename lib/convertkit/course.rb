module ConvertKit
  class Course

  	attr_reader :id, :name, :subscriber_count, :unsubscribe_count, :details, :created_at, :updated_at
    attr_writer :client

    def load(data, client)
      @client = client

      @id                = data["id"]
      @name              = data["name"]
      @subscriber_count  = data["subscriber_count"]
      @unsubscribe_count = data["unsubscribe_count"]
      @details           = data["details"]
      @created_at        = data["created_at"]
      @updated_at        = data["updated_at"]


    end

    def initialize(id)
      @id = id
    end

  end

  class Client
    def courses()
      raw   = get_request("/courses")
      courses = []

      raw.each do |raw_course|
        course = ConvertKit::Course.new(raw_course["id"])
        course.load(raw_course, self)

        courses << course
      end

      courses
    end
  end
end