class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name, :null => false
      t.text :description
      t.text :indication
      t.text :pharmacology
      t.integer :drugbank_id, :null => false

      t.timestamps
    end
  end
end
