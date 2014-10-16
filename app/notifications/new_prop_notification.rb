class NewPropNotification < BaseNotification
  pattr_initialize :prop_receiver, :prop_giver, :content

  def body
    "#{prop_giver} just gave a prop to *#{prop_receiver}*: _#{content}_"
  end
end
