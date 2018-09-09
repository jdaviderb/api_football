# frozen_string_literal: true

module ApiFootball
  class H2h
    attr_reader :http
    def initialize(http:)
      @http = http
    end

    def all(first_team:, second_team:)
      http.request(
        action: :get_odds,
        firstTeam: first_team,
        secondTeam: second_team
      )
    end
  end
end
