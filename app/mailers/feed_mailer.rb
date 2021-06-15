class FeedMailer < ApplicationMailer
  def feed_mailer(feed)
    @feed = feed
    mail to: "tjeripo86@live.com", subject: "tjeripo86@live.com"
  end
end
