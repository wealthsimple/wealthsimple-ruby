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
      let(:request) { stub_request(:get, "https://api.production.wealthsimple.com/v1/accounts/123") }

      context "with 200 OK response" do
        before do
          request.to_return(status: 200, body: '{"account": 123}')
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

      context "with 404 error response" do
        before do
          request.to_return(status: 404, body: '{"status":"not_found","code":404,"message":"Could not find User","reference_id":"3d1f4569-fe76-43e9-8051-d47016388d6b"}')
        end

        it "raises ApiError with response details" do
          error_occurred = false

          begin
            subject.execute
          rescue Wealthsimple::ApiError => e
            error_occurred = true
            expect(e.status).to eq(404)
            expect(e.resource.message).to eq('Could not find User')
            expect(e.resource.reference_id).to eq('3d1f4569-fe76-43e9-8051-d47016388d6b')
            expect(e.to_h).to include({"message" => "Could not find User"})
          end

          expect(error_occurred).to be(true)
        end
      end
    end
  end

  context "with missing configuration" do
    it "raises an error on initialize" do
      expect { described_class.new(method: :post, path: "/accounts", body: '') }.to raise_error(/Invalid or missing config/)
    end
  end
end
