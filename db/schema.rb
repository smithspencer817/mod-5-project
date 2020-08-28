# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_215630) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "questioner_id", null: false
    t.integer "answerer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answerer_id"], name: "index_questions_on_answerer_id"
    t.index ["questioner_id"], name: "index_questions_on_questioner_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "review_giver_id", null: false
    t.integer "user_skill_id", null: false
    t.integer "review_receiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_giver_id"], name: "index_reviews_on_review_giver_id"
    t.index ["review_receiver_id"], name: "index_reviews_on_review_receiver_id"
    t.index ["user_skill_id"], name: "index_reviews_on_user_skill_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "users", column: "answerer_id"
  add_foreign_key "questions", "users", column: "questioner_id"
  add_foreign_key "reviews", "user_skills"
  add_foreign_key "reviews", "users", column: "review_giver_id"
  add_foreign_key "reviews", "users", column: "review_receiver_id"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
