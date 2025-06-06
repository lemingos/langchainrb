class CreateLangchainMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :langchain_messages do |t|
      t.integer :thread_id
      t.json :content
      t.integer :tool_call_id
      t.string :role

      t.timestamps
    end
    add_index :langchain_messages, :thread_id
  end
end
