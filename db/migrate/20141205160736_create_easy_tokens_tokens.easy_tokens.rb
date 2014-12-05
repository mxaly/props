# This migration comes from easy_tokens (originally 20141103194654)
class CreateEasyTokensTokens < ActiveRecord::Migration
  def change
    create_table :easy_tokens_tokens do |t|
      t.string :value
      t.string :description
      t.string :owner_id
      t.datetime :deactivated_at

      t.timestamps
    end
  end
end
