class ScenicRouteMailer < ApplicationMailer

  def creation_email(user)
    @recipient = user
    mail(to: @recipient.email, subject: "Welcome to The Scenic Route!")
  end

  def friend_mail(user, recipient)
    @sender = user
    @recipient = recipient
    mail(to: @recipient.email, subject: "#{@sender.username} added you as a friend!")
  end
end
