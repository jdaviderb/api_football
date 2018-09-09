# frozen_string_literal: true

RSpec.describe ApiFootball::H2h do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  let(:http) { ApiFootball::Http.new(api_key: api_key) }

  subject { described_class.new(http: http) }

  describe "#all" do
    let(:all) { subject.all(first_team: "Brentford", second_team: "Rotherham
    United") }

    skip "show all events" do
      VCR.use_cassette("h2h/all") do
        expect(all).to be_an(Array)
      end
    end
  end
end
