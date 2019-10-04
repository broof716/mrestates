class NotificationMailer < ApplicationMailer
  default from: "no-reply@mrestateapp.com"

  def comment_added(comment)
    @estate = comment.estate
    @estate_owner = @estate.user
    mail(to: @estate_owner.email,
         subject: "A comment has been added to your #{@estate.name}")
  end
end