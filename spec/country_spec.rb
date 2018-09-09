# frozen_string_literal: true

RSpec.describe ApiFootball::Country do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  let(:http) { ApiFootball::Http.new(api_key: api_key) }

  subject { described_class.new(http: http) }

  describe "#all" do
    let(:all) { subject.all }
    let(:country) { all.first }
    it "show all countries" do
      VCR.use_cassette("countries/all") do
        expect(all).to be_an(Array)
        expect(country).to have_key("country_id")
        expect(country).to have_key("country_name")
      end
    end
  end
end
