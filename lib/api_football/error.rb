# frozen_string_literal: true

module ApiFootball
  module Error
    class ArgumentError < ArgumentError; end
    class ApiError < StandardError; end
  end
end
