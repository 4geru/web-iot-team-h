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

ActiveRecord::Schema.define(version: 2019_02_02_021621) do

  create_table "commands", force: :cascade do |t|
    t.boolean "mizu"
    t.boolean "red_led"
    t.boolean "green_led"
    t.boolean "blue_led"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "tanbo_id"
    t.decimal "shitsudo"
    t.decimal "oto"
    t.decimal "ondo"
    t.decimal "camera"
    t.decimal "light"
    t.datetime "loged_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
