# frozen_string_literal: true

module ApiFootball
  class Response
    attr_reader :body, :result

    def initialize(body:)
      @result = JSON.parse(body)
      if @result.kind_of?(Hash) && @result.key?("error")
        raise ApiFootball::Error::ApiError, @result["message"]
      end
    end
  end
end
