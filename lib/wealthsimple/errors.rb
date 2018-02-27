module Wealthsimple
  class ApiError < StandardError
    def initialize(response)
      @response = response

      message = resource.message.presence
      message ||= "ApiError with status #{status} received."

      super(message)
    end

    def method_missing(method_name, *args, &block)
      @response.send(method_name, *args, &block)
    end
  end
end
