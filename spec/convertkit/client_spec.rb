require "spec_helper"

module ConvertKit
  describe Client do
    describe "#initialize" do
      let(:client) { ConvertKit::Client.new(123) }

      it "returns a new client" do
        expect(client).to be_a(Object)
      end

      it "saves the client id" do
        expect(client.key).to be(123)
      end

      it "uses version 2" do
        expect(client.version).to be(2)
      end

      it "uses the https convertkit endpoint" do
        expect(client.uri).to eq("https://api.convertkit.com")
      end

      it "allows you to pass in the uri" do
        expect(ConvertKit::Client.new(123, "https://api.dummy.com").uri).to eq("https://api.dummy.com")
      end

    end
  end
end