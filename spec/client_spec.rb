# frozen_string_literal: true

RSpec.describe ApiFootball::Client do
  let(:api_key) do
    "655309a09751b590f3ae9bcc01757eace8dcd4c29605170e6675a6044c1b3a3a"
  end

  subject { described_class.new(api_key: api_key) }

  describe "#countries" do
    let(:mock) { instance_double(ApiFootball::Country) }
    before do
      expect(ApiFootball::Country).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.countries) }
  end

  describe "#competitions" do
    let(:mock) { instance_double(ApiFootball::Competition) }
    before do
      expect(ApiFootball::Competition).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.competitions).to eq(mock) }
  end

  describe "#standings" do
    let(:mock) { instance_double(ApiFootball::Standing) }
    before do
      expect(ApiFootball::Standing).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.standings).to eq(mock) }
  end

  describe "#events" do
    let(:mock) { instance_double(ApiFootball::Event) }

    before do
      expect(ApiFootball::Event).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.events).to eq(mock) }
  end

  describe "#odds" do
    let(:mock) { instance_double(ApiFootball::Odd) }

    before do
      expect(ApiFootball::Odd).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.odds).to eq(mock) }
  end

  describe "#h2h" do
    let(:mock) { instance_double(ApiFootball::H2h) }
    before do
      expect(ApiFootball::H2h).to receive(:new)
        .with(http: subject.http)
        .and_return(mock)
    end

    it { expect(subject.h2h).to eq(mock) }
  end
end
