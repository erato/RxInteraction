class CreateDrugInteractions < ActiveRecord::Migration
  def change
    create_table :drug_interactions do |t|
      t.integer :drugbank_id, :null => false
      t.integer :interaction_drugbank_id, :null => false
      t.text :description, :null => false
      t.float :severity, :null => false
      t.float :likelihood, :null => false
    end
  end
end
