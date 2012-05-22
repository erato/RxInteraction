class AddDrugBankIdIndex < ActiveRecord::Migration
  def change

    add_index :drugs, :drugbank_id,
          { :name => 'idx_drugs_drugbank_id', :unique => true }

    add_index :drugs, :name,
          { :name => 'idx_drugs_name' }

    add_index :drug_interactions, :drugbank_id,
          { :name => 'idx_drug_interactions_drugbank_id' }

    add_index :drug_interactions, :interaction_drugbank_id,
          { :name => 'idx_drug_interactions_interaction_drugbank_id' }

    add_index :drug_interactions, [:drugbank_id, :interaction_drugbank_id],
          { :name => 'idx_drug_interactions_drugbank_id_interaction_drugbank_id', :unique => true }
  end
end
