class AddUpvotesCountToProps < ActiveRecord::Migration
  def change
    add_column :props, :upvotes_count, :integer, default: 0
  end
end
