class MovePropReceivers < ActiveRecord::Migration
  def up
    say_with_time 'Creating PropReceiver objects from props...' do
      Prop.pluck(:user_id, :id).each do |p|
        PropReceiver.create! user_id: p[0], prop_id: p[1]
      end
    end
  end

  def down
    say_with_time 'Adding user_id to props...' do
      PropReceiver.find_each do |p|
        Prop.find(p.prop_id).update_column(:user_id, p.user_id)
      end
    end
  end
end
