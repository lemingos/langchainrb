# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_08_194928) do
  create_table "langchain_agents", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.json "model_config", default: {}
    t.string "tool_choice"
    t.boolean "auto_tool_execution", default: false
    t.boolean "parallel_tool_calls", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "langchain_messages", force: :cascade do |t|
    t.integer "thread_id"
    t.json "content"
    t.integer "tool_call_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thread_id"], name: "index_langchain_messages_on_thread_id"
  end

  create_table "langchain_threads", force: :cascade do |t|
    t.integer "agent_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "langchain_tool_calls", force: :cascade do |t|
    t.string "external_id"
    t.integer "message_id"
    t.string "name"
    t.json "payload", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_langchain_tool_calls_on_external_id", unique: true
    t.index ["message_id"], name: "index_langchain_tool_calls_on_message_id"
  end

  create_table "langchain_tools", force: :cascade do |t|
    t.string "name"
    t.json "config"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
