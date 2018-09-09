# frozen_string_literal: true

module ApiFootball
  class Odd
    attr_reader :http
    def initialize(http:)
      @http = http
    end

    def all(to:, from:)
      http.request(action: :get_odds, to: to, from: from)
    end

    def filter_by(params)
      valid_params!(params)
      http.request({ action: :get_odds }.merge(params))
    end

    private
      def valid_params!(params)
        return true if params_valid?(params)
        raise ApiFootball::Error::ArgumentError.new(
          "params required: #{required_params.join(", ")}"
        )
      end

      def params_valid?(params)
        (required_params - params.keys.map(&:to_s)).empty?
      end

      def required_params
        ["to", "from"]
      end
  end
end
