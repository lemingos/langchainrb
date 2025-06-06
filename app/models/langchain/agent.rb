# frozen_string_literal: true


# agent = Langchain::Agent.create(
#   name: "Agent",
#   model_config: { name: "gpt-3.5-turbo" },
#   instructions: "You're a News Reporter AI",
# )
# agent.files << Langchain::File.new(name: "file.txt", path: "path/to/file")
# agent.ask("Summarize file.txt")

module Langchain
  class Agent < ApplicationRecord

    has_many :threads
    has_many :tools, dependent: :destroy
    has_many :files, dependent: :destroy
    has_many :messages, through: :threads

    validates :name, presence: true
    validates :instructions, presence: true
    validate :model_config_requires_name
    
    def ask(message)
      threads.new.messages.build(content: message, role: "user")
    end

    def llm
      @llm ||= Langchain::LLM::Factory.create(model_config)
    end

    def model=(model_name)
      self.model_config = self.model_config.merge("name" => model_name)
    end

    def chat_payload
      {
        instructions: instructions,
        tools: [],
        tool_choice: tool_choice,
        parallel_tool_calls: parallel_tool_calls
      }
    end

    private

    def model_config_requires_name
      errors.add(:model_config, "requires a :name") unless model_config['name']
    end

  end
end
