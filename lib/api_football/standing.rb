# frozen_string_literal: true

module ApiFootball
  class Standing
    attr_reader :http
    def initialize(http:)
      @http = http
    end

    def all
      http.request(action: :get_standings)
    end

    def filter_by(params)
      http.request({ action: :get_standings }.merge(params))
    end
  end
end
