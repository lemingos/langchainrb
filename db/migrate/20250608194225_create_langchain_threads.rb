class CreateLangchainThreads < ActiveRecord::Migration[8.0]
  def change
    create_table :langchain_threads do |t|
      t.integer :agent_id
      t.string :state

      t.timestamps
    end
  end
end
