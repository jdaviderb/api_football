# frozen_string_literal: true

RSpec.describe ApiFootball::Odd do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  let(:http) { ApiFootball::Http.new(api_key: api_key) }

  subject { described_class.new(http: http) }

  describe "#all" do
    let(:from) { "2018-08/01" }
    let(:to) { "2018-08/20" }
    let(:all) { subject.all(from: from, to: to) }

    it "show all events" do
      VCR.use_cassette("odds/all") do
        expect(all).to be_an(Array)
      end
    end
  end

  describe "#filter_by" do
    let(:match) { "304968" }
    let(:from) { "2018-08/01" }
    let(:to) { "2018-08/20" }
    let(:exception) { ApiFootball::Error::ArgumentError }
    let(:filter_by_match) do
      subject.filter_by(to: to, from: from, match_id: match)
    end

    it "filter by match" do
      VCR.use_cassette("odds/filter_by_league") do
        expect(filter_by_match).to be_an(Array)
        expect(filter_by_match.first["match_id"]).to eq(match)
      end
    end

    it "raise exception if Arguments (to, from) are not present" do
      expect { subject.filter_by(to: to) }
        .to raise_error(exception, /params required/)
      expect { subject.filter_by(from: to) }
        .to raise_error(exception, /params required/)
    end
  end
end
