# frozen_string_literal: true

RSpec.describe ApiFootball do
  it "has a version number" do
    expect(ApiFootball::VERSION).not_to be nil
  end
end
