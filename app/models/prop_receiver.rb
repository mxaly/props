class PropReceiver < ActiveRecord::Base
  belongs_to :prop
  belongs_to :user
end
