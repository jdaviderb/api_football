# frozen_string_literal: true

module ApiFootball
  class Http
    attr_reader :api_key, :adapter
    ENDPOINT = "https://apifootball.com/api/"

    def initialize(api_key:, adapter: nil)
      @api_key = api_key
      @adapter = adapter
    end

    def request(params)
      ApiFootball::Response.new(
        body: client.get(nil, default_params.merge(params)).body
      ).result
    end

    def default_params
      { APIkey: api_key }
    end

    private

      def client
        Faraday.new(url: ENDPOINT) do |faraday|
          faraday.adapter adapter || Faraday.default_adapter
        end
      end
  end
end
