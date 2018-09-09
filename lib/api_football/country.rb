# frozen_string_literal: true

module ApiFootball
  class Country
    attr_reader :http
    def initialize(http:)
      @http = http
    end

    def all
      http.request(action: :get_countries)
    end
  end
end
