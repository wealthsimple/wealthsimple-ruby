module Wealthsimple
  class << self
    attr_writer :config
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.reset_config!
    @config = Configuration.new
  end

  class Configuration
    REQUIRED_ATTRIBUTES = [:env, :api_version, :client_id]
    ATTRIBUTES = [:client_secret, :auth] + REQUIRED_ATTRIBUTES
    attr_accessor *ATTRIBUTES

    def validate!
      raise "Invalid or missing config"  unless REQUIRED_ATTRIBUTES.all? { |attribute| send(attribute).present? }
    end
  end
end
