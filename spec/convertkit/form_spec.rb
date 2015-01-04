require "spec_helper"

module ConvertKit
  describe Form do
  	let(:client) { ConvertKit::Client.new("f9922361d11e7339cc1cde3d54c071") }

  	it "returns a array of form objects" do

  		forms = client.forms()

  		expect(forms).to be_a(Array)
  		expect(forms.count).to eq(1)
  		expect(forms.first).to be_a(ConvertKit::Form)

  		# Check the data is set
  		form = forms.first
  		expect(form.id).to eq(4812649)
  		expect(form.subscriber_count).to eq(0)
  		expect(form.name).to eq("Test form")

  	end

  end
end