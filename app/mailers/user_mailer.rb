class UserMailer < ApplicationMailer
  default from: "money@zegetech.com"

  def transaction_confirmation(user, transaction)
    @user = user
    @transaction = transaction
    mail to: user.email, subject: "Transaction Confirmation"
  end
end
