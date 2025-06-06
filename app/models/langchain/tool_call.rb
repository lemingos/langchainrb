module Langchain
  class ToolCall < ApplicationRecord
    belongs_to :message
  end
end
