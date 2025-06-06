module Langchain
  class Message < ApplicationRecord
    belongs_to :thread
    belongs_to :tool_call, optional: true

    has_one :assistant, through: :thread

    delegate :llm, to: :assistant

    validates :role, presence: true
    validates :content, presence: true

    def chat_payload
      { content: content, role: role }
    end
  end
end
