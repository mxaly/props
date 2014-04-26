class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.references :user, index: true
      t.references :propser, index: true
      t.string :body

      t.timestamps
    end
  end
end
