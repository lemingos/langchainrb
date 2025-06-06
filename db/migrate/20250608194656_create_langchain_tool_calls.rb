class CreateLangchainToolCalls < ActiveRecord::Migration[8.0]
  def change
    create_table :langchain_tool_calls do |t|
      t.string :external_id
      t.integer :message_id
      t.string :name
      t.json :payload, default: {} # Change to jsonb if using postgres

      t.timestamps
    end
    add_index :langchain_tool_calls, :external_id, unique: true
    add_index :langchain_tool_calls, :message_id
  end
end
