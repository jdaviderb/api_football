# frozen_string_literal: true

RSpec.describe ApiFootball::Response do
  let(:raw_response) { '{"id": 1}' }
  let(:raw_response_error) { '{"error": true, "message": "boom"}' }

  subject { described_class.new(body: raw_response) }

  it "parse raw response" do
    expect(described_class.new(body: raw_response).result).to be_an(Hash)
  end

  describe "exceptions" do
    it "raise error if response include error" do
      expect { described_class.new(body: raw_response_error) }
        .to raise_error(ApiFootball::Error::ApiError, /boom/)
    end
  end
end
