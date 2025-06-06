# frozen_string_literal: true

require 'yaml'

module Langchain
  module LLM
    class Factory
      class UnsupportedModelError < StandardError; end
      class ConfigurationError < StandardError; end

      CONFIG_PATH = File.expand_path('../../../config/models.yml', __dir__)

      class << self
        def create(model_config = { name: default_model })
          config = find_default_model_config(model_config.symbolize_keys![:name])
          model_class = "Langchain::LLM::#{config[:provider_class_name]}".constantize
          api_key = ENV.fetch("#{config[:provider_class_name].upcase}_API_KEY", nil)
          
          model_class.new(api_key: api_key, default_options: config[:default_config].merge(model_config))
        rescue NameError => e
          raise UnsupportedModelError, "Failed to initialize LLM client: #{e.message}"
        end

        private

        def default_model
          models_config.dig(:defaults, :model) || 'gpt-3.5-turbo'
        end
        
        def find_default_model_config(model_name)
          models_config.find { |model| model[:name] == model_name }
        end

        def models_config
          @config ||= YAML.load_file(CONFIG_PATH, aliases: true, symbolize_names: true)
        end
      end
    end
  end
end
