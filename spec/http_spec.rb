# frozen_string_literal: true

RSpec.describe ApiFootball::Http do
  describe "#request" do
    context "success" do
      subject { described_class.new(api_key: ":)") }
      let(:raw_json) { '{"id": 1}' }

      it do
        client = double
        client_reponse = double(body: raw_json)

        expect(client).to receive(:get)
          .with(nil, APIkey: ":)", action: :get_countries)
          .and_return(client_reponse)

        allow(subject).to receive(:client).and_return(client)
        expect(subject.request(action: :get_countries)).to be_an(Hash)
      end
    end

    context "error" do
      subject { described_class.new(api_key: "invalid") }
      let(:exception) { ApiFootball::Error::ApiError }

      it "raise exception" do
        VCR.use_cassette("errors/api_key") do
          expect { subject.request({}) }
            .to raise_error(exception, /Authentification failed!/)
        end
      end
    end
  end
end
