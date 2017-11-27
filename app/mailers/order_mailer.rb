class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.send_when_order.subject
  #
  default from: "test.mail.sample321@gmail.com"

  def send_when_order(user)
    @user = user
    mail to:      user.email,
         subject: '注文完了のお知らせ'
  end
end
