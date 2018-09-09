# frozen_string_literal: true

module ApiFootball
  class Competition
    attr_reader :http
    def initialize(http:)
      @http = http
    end

    def all
      http.request(action: :get_leagues)
    end

    def filter_by(params)
      http.request({ action: :get_leagues }.merge(params))
    end
  end
end
