# frozen_string_literal: true

RSpec.describe ApiFootball::Standing do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  let(:http) { ApiFootball::Http.new(api_key: api_key) }

  subject { described_class.new(http: http) }

  describe "#filter_by" do
    let(:championship) { "63" }
    let(:filter_by_league) { subject.filter_by(league_id: championship) }
    let(:standing_response_keys) do
      ["country_name", "league_id", "league_name", "team_name",
      "overall_league_position", "overall_league_payed", "overall_league_W",
      "overall_league_D", "overall_league_L", "overall_league_GF",
      "overall_league_GA", "overall_league_PTS", "home_league_position",
      "home_league_payed", "home_league_W", "home_league_D", "home_league_L",
      "home_league_GF", "home_league_GA", "home_league_PTS",
      "away_league_position", "away_league_payed", "away_league_W",
      "away_league_D", "away_league_L", "away_league_GF", "away_league_GA",
      "away_league_PTS"]
    end

    it "filter by league" do
      VCR.use_cassette("standings/filter_by_league") do
        expect(filter_by_league).to be_an(Array)
        expect(filter_by_league.first.keys)
          .to match_array(standing_response_keys)
        expect(filter_by_league.first["league_id"]).to eq(championship)
      end
    end
  end
end
