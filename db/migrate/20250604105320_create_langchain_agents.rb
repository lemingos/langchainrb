# frozen_string_literal: true

class CreateLangchainAgents < ActiveRecord::Migration[8.0]
  def change
    create_table :langchain_agents do |t|
      t.string :name
      t.string :instructions
      t.json :model_config, default: { }
      t.string :tool_choice
      t.boolean :auto_tool_execution, default: false
      t.boolean :parallel_tool_calls, default: false

      t.timestamps
    end
  end
end
