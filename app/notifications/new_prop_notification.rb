class NewPropNotification < BaseNotification
  include Rails.application.routes.url_helpers

  pattr_initialize :prop_receivers, :prop_giver, :content

  def body
    "#{prop_giver} just gave a prop to *#{prop_receivers_list}*: " \
      "_#{content}_ - [Check it out!](#{app_domain})"
  end

  private

  def app_domain
    root_url(protocol: :https, host: AppConfig.app_domain)
  end

  def prop_receivers_list
    prop_receivers.to_a.join(', ')
  end
end
