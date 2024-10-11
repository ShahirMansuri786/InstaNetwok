class PostConfirmationMailer < ApplicationMailer
  def post_confirmation_mailer
    @user = params[:user]
    mail(to: @user.email , subject: "post successfully created")
  end
end
