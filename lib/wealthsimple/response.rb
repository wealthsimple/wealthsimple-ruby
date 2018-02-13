module Wealthsimple
  class Response
    attr_reader :status, :headers, :body, :resource

    def initialize(status:, headers:, body:)
      @status = status
      @headers = headers.transform_keys(&:downcase).with_indifferent_access
      @body = body
      @parsed_body = parse_body(body)
      @resource = convert_to_resource(@parsed_body)
    end
    delegate :[], to: :to_h

    def header(key)
      headers[key.downcase]
    end

    def as_json(_options = {})
      @parsed_body
    end

    def to_h
      @parsed_body
    end

    private

    def convert_to_resource(parsed_body)
      for_each_hash(parsed_body) do |hash|
        RecursiveOpenStruct.new(hash, recurse_over_arrays: true)
      end
    end

    def parse_body(body)
      json = JSON.parse(body)
      for_each_hash(json, &:with_indifferent_access)
    rescue JSON::ParserError, TypeError
      body
    end

    # Recursively call block on each hash in the provided object
    def for_each_hash(obj, &block)
      if obj.is_a?(Array)
        obj.map { |el| for_each_hash(el, &block) }
      elsif obj.is_a?(Hash)
        yield(obj)
      else # Integer, boolean, string, null
        obj
      end
    end
  end
end
