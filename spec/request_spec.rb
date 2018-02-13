describe Wealthsimple::Request do
  context "with valid configuration" do
    before do
      Wealthsimple.configure do |config|
        config.env = :production
        config.api_version = "v1"
        config.client_id = "oauth_client_1"
      end
    end

    describe "#execute (POST)" do
      subject { described_class.new(method: :post, path: "/accounts", body: '{"someJSON": 123}', headers: {'foo': 'bar'}) }

      before do
        stub_request(:post, "https://api.production.wealthsimple.com/v1/accounts").to_return(status: 200, body: '{"success": true}')
      end

      it "makes the correct request" do
        subject.execute
        expect(WebMock).to have_requested(:post, "https://api.production.wealthsimple.com/v1/accounts")
          .with({
            body: '{"someJSON": 123}',
            headers: {
              'Content-Type': 'application/json',
              'foo': 'bar',
            },
          }).once
      end

      it "returns the response" do
        response = subject.execute
        expect(response).to be_a(Wealthsimple::Response)
        expect(response.resource.success).to eq(true)
      end
    end

    describe "#execute (GET)" do
      subject { described_class.new(method: :get, path: "/accounts/123") }

      before(:each) do
        stub_request(:get, "https://api.production.wealthsimple.com/v1/accounts/123").to_return(status: 200, body: '{"account": 123}')
      end

      it "makes the correct request" do
        subject.execute
        expect(WebMock).to have_requested(:get, "https://api.production.wealthsimple.com/v1/accounts/123")
          .with({
            body: nil,
            headers: {'Content-Type' => 'application/json'},
          }).once
      end

      it "returns the response" do
        response = subject.execute
        expect(response).to be_a(Wealthsimple::Response)
        expect(response.resource.account).to eq(123)
      end
    end
  end

  context "with missing configuration" do
    it "raises an error on initialize" do
      expect { described_class.new(method: :post, path: "/accounts", body: '') }.to raise_error(/Invalid or missing config/)
    end
  end
end
