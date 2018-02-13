describe Wealthsimple::Response do
  let(:status) { 200 }
  let(:headers) { { 'Content-Length' => '35' } }
  subject(:response) { described_class.new(status: status, headers: headers, body: body) }

  context "for a JSON hash response" do
    let(:body) { '{"status": "ok", "messages": [123, true]}' }

    its(:resource) { is_expected.to be_a(RecursiveOpenStruct) }

    its(:status) { is_expected.to eq(status) }
    its(:headers) { is_expected.to eq({ "content-length" => "35" }) }

    its('resource.status') { is_expected.to eq('ok') }
    its('resource.messages') { is_expected.to eq([123, true]) }

    describe "#header" do
      it "returns header regardless of case" do
        expect(response.header("Content-Length")).to eq("35")
        expect(response.header("content-length")).to eq("35")
        expect(response.header("CONTENT-LENGTH")).to eq("35")
      end
    end

    describe "#as_json" do
      subject(:as_json) { response.as_json }

      it { is_expected.to be_a(Hash) }

      it "has indifferent access" do
        expect(as_json[:messages]).to eq([123, true])
        expect(as_json['messages']).to eq([123, true])
      end
    end
  end

  context "for a JSON array response" do
    let(:body) { '[123, true, {"status": "ok"}]' }

    its(:resource) { is_expected.to be_a(Array) }

    describe ".first" do
      subject(:first) { response.resource.first }

      it { is_expected.to eq(123) }
    end

    describe ".second" do
      subject(:second) { response.resource.second }

      it { is_expected.to eq(true) }
    end

    describe ".last" do
      subject(:last) { response.resource.last }

      it { is_expected.to be_a(RecursiveOpenStruct) }
      its(:status) { is_expected.to eq("ok") }
    end
  end

  context "for a non-JSON string response" do
    let(:body) { "Hola!" }

    its(:status) { is_expected.to eq(status) }
    its(:headers) { is_expected.to eq({ "content-length" => "35" }) }
    its(:body) { is_expected.to eq(body) }
  end

  context "for an empty response body" do
    let(:body) { "" }

    its(:status) { is_expected.to eq(status) }
    its(:headers) { is_expected.to eq({ "content-length" => "35" }) }
    its(:body) { is_expected.to eq(body) }
  end
end
