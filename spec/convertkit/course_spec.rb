require "spec_helper"

module ConvertKit
  describe Course do
  	let(:client) { ConvertKit::Client.new("f9922361d11e7339cc1cde3d54c071") }

  	it "returns a array of course objects" do

  		courses = client.courses()

  		expect(courses).to be_a(Array)
  		expect(courses.count).to eq(1)
  		expect(courses.first).to be_a(ConvertKit::Course)

  		# Check the data is set
  		course = courses.first
  		expect(course.id).to eq(436)
  		expect(course.subscriber_count).to eq(444)
  		expect(course.name).to eq("Test Course")

  	end

  	it "returns a single course" do
  		course = ConvertKit::Course.find(4, client)
  		
  		expect(course).to be_a(ConvertKit::Course)

  		# Check the data is set
  		expect(course.id).to eq(436)
      expect(course.subscriber_count).to eq(444)
      expect(course.name).to eq("Test Course")
  	end

  end
end