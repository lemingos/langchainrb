module Langchain
  class Thread < ApplicationRecord
    belongs_to :agent 
    has_many :messages

    delegate :llm, to: :agent
    delegate :adapter, to: :llm, prefix: true

    def chat_payload
      llm_adapter.build_chat_params(**agent.chat_payload, messages: messages.map(&:chat_payload))
    end

    def instructions
      @instructions ||= agent.instructions
    end

    def tools
      @tools ||= agent.tools
    end

    def tool_choice
      @tool_choice ||= agent.tool_choice
    end

    def parallel_tool_calls
      @parallel_tool_calls ||= agent.parallel_tool_calls
    end

    def chat
      llm.chat(**chat_payload)
    end
  end
end
