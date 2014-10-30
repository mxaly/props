class Notifier
  class SlackNotifier < Base
    private

    def notify
      channel.ping notification.to_s
    end

    def channel
      @channel ||= ::Slack::Notifier.new AppConfig.slack.webhook_url,
        channel: AppConfig.slack.default_channel,
        username: 'PropsApp',
        color: '#0092ca'
    end
  end
end
