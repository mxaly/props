class CreatePropReceivers < ActiveRecord::Migration
  def change
    create_table :prop_receivers do |t|
      t.references :prop, index: true
      t.references :user, index: true
    end

    add_index :prop_receivers, [:prop_id, :user_id], unique: true
  end
end
