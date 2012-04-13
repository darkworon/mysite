class UserNotifier < ActionMailer::Base
  default from: "oleg@nights.su"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.activation_notifier.activation.subject
  #
  def signup(activation)
    @activation = activation
    mail to: @activation.user.email, subject: "Account activation"
    #puts "Sended to #{@activation.user.email}"
  end
  
  #def test
  #  mail to: "woron@nights.su", subject: "Account activation"
  #end
  
  def password_recover(recover)
    @recover = recover
    mail to: @recover.user.email, subject: "Account recover"
  end
end
