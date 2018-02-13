module Wealthsimple
# Define class methods for more succinct requests
  %i(get post put delete head patch).each do |http_method|
    define_singleton_method(http_method) do |path, headers: {}, query: {}, body: nil|
      Request.new(method: http_method, path: path, headers: headers, query: query, body: body).execute
    end
  end

  class Request
    attr_reader :extra_attributes
    def initialize(method:, path:, headers: {}, query: {}, body: nil, **extra_attributes)
      Wealthsimple.config.validate!
      @method = method
      @path = path
      @path = "/#{@path}" unless @path.start_with?("/")
      @path = "#{@path}?#{query.to_param}" if query.present?
      @path = "/#{Wealthsimple.config.api_version}#{@path}"
      @body = body
      @headers = default_headers.merge(headers)
      @extra_attributes = extra_attributes || {}
    end

    def execute
      connection = Faraday.new(url: base_url) do |faraday|
        faraday.use Faraday::Response::RaiseError
        faraday.adapter Faraday.default_adapter
      end
      response = connection.send(@method) do |request|
        request_args = {
          url: @path,
          method: @method,
          headers: @headers,
          body: processed_request_body,
          timeout: 10,
        }.compact
        request.url(request_args[:url])
        request.headers = request_args[:headers]
        request.body = request_args[:body]
        if request_args[:timeout]
          request.options.open_timeout = request_args[:timeout]
          request.options.timeout = request_args[:timeout]
        end
        request
      end
      Response.new(status: response.status, headers: response.headers, body: response.body)
    end

    private

    def base_url
      "https://api.#{Wealthsimple.config.env}.wealthsimple.com"
    end

    def default_headers
      {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Date': Time.now.utc.httpdate,
      }
    end

    def processed_request_body
      if @body.nil? || @body.is_a?(String)
        @body
      else
        @body.to_json # TODO: is there a better way?
      end
    end
  end
end
