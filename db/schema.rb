# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_16_112536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "answers_results", id: false, force: :cascade do |t|
    t.bigint "result_id", null: false
    t.bigint "answer_id", null: false
    t.index ["answer_id"], name: "index_answers_results_on_answer_id"
    t.index ["result_id"], name: "index_answers_results_on_result_id"
  end

  create_table "game_configs", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "identifier"
    t.string "level_intro_message"
    t.string "level_conclusion_message"
    t.string "show_score_conclusion_level"
    t.string "next_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "step_id"
    t.integer "order"
    t.index ["step_id"], name: "index_questions_on_step_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "score"
    t.bigint "step_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_results_on_step_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "identifier"
    t.string "file1_name"
    t.string "file1_content"
    t.string "file1_clarification"
    t.string "file2_name"
    t.string "file2_content"
    t.string "file2_clarification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.integer "order"
    t.index ["level_id"], name: "index_steps_on_level_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "levels_id"
    t.bigint "step_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["levels_id"], name: "index_users_on_levels_id"
    t.index ["step_id"], name: "index_users_on_step_id"
  end

end
