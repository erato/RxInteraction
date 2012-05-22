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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110707131632) do

  create_table "drug_interactions", :force => true do |t|
    t.integer "drugbank_id",             :null => false
    t.integer "interaction_drugbank_id", :null => false
    t.text    "description",             :null => false
    t.float   "severity",                :null => false
    t.float   "likelihood",              :null => false
  end

  add_index "drug_interactions", ["drugbank_id", "interaction_drugbank_id"], :name => "idx_drug_interactions_drugbank_id_interaction_drugbank_id", :unique => true
  add_index "drug_interactions", ["drugbank_id"], :name => "idx_drug_interactions_drugbank_id"
  add_index "drug_interactions", ["interaction_drugbank_id"], :name => "idx_drug_interactions_interaction_drugbank_id"

  create_table "drugs", :force => true do |t|
    t.string   "name",         :null => false
    t.text     "description"
    t.text     "indication"
    t.text     "pharmacology"
    t.integer  "drugbank_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drugs", ["drugbank_id"], :name => "idx_drugs_drugbank_id", :unique => true
  add_index "drugs", ["name"], :name => "idx_drugs_name"

end
