# frozen_string_literal: true

RSpec.describe ApiFootball::Competition do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  let(:http) { ApiFootball::Http.new(api_key: api_key) }

  subject { described_class.new(http: http) }

  describe "#all" do
    let(:all) { subject.all }
    let(:competition) { all.first }

    it "show all competitions" do
      VCR.use_cassette("competitions/all") do
        expect(all).to be_an(Array)

        expect(competition).to have_key("country_id")
        expect(competition).to have_key("country_name")
        expect(competition).to have_key("league_id")
        expect(competition).to have_key("league_name")
      end
    end
  end

  describe "#filter_by" do
    let(:england) { "169" }
    let(:filter_by_country) { subject.filter_by(country_id: england) }

    it "filter by country" do
      VCR.use_cassette("competitions/filter_by_country") do
        expect(filter_by_country).to be_an(Array)
        expect(filter_by_country.first["country_id"]).to eq(england)
      end
    end
  end
end
