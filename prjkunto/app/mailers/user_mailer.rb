class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  @user = user
  mail(:to => user.email, :subject => "Registered")
end
