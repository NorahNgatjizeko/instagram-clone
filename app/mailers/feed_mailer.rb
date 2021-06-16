class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: "tjeripo86@live.com", subject: "Inquiry confirmation email"
  end
end
