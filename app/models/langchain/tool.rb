module Langchain
  class Tool < ApplicationRecord
    belongs_to :assistant
  end
end
