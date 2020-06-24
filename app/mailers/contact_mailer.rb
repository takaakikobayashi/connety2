class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['MAIL'], subject: "お問い合わせを受け付けました"
  end

  def send_when_admin_reply(user, contact)
    @user = user
    @answer = contact.reply_text
    mail to: user.email, subject: '【Connety運営】お問い合わせありがとうございます'
  end
end
