# frozen_string_literal: true

module Gitlab
  # @private
  class API < Request
    # @private
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)
    # @private
    alias auth_token= private_token=

    # Creates a new API.
    # @raise [Error:MissingCredentials]
    def initialize(options = {})
      puts "Debug alex Gitlab - initialize - options = #{options or 'nil'}"
      options = Gitlab.options.merge(options)
      (Configuration::VALID_OPTIONS_KEYS + [:auth_token]).each do |key|
        puts "Debug alex Gitlab - initialize - #{key} = #{options[key] or 'nil'}"
        send("#{key}=", options[key]) if options[key]
      end
      request_defaults(sudo)
      self.class.headers 'User-Agent' => user_agent
    end
  end
end
