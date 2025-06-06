class CreateLangchainTools < ActiveRecord::Migration[8.0]
  def change
    create_table :langchain_tools do |t|
      t.string :name
      t.json :config

      t.timestamps
    end
  end
end
