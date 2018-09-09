# frozen_string_literal: true

module ApiFootball
  class Client
    attr_reader :api_key

    def initialize(api_key:)
      @api_key = api_key
    end

    def http
      @http ||= ApiFootball::Http.new(api_key: api_key)
    end

    def countries
      @countries ||= Country.new(http: http)
    end

    def competitions
      @competitions ||= Competition.new(http: http)
    end

    def events
      @events ||= Event.new(http: http)
    end

    def standings
      @standings ||= Standing.new(http: http)
    end

    def odds
      @odds ||= Odd.new(http: http)
    end

    def h2h
      @h2h ||= H2h.new(http: http)
    end
  end
end
