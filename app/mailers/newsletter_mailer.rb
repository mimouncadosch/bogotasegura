class NewsletterMailer < ActionMailer::Base
  default from: "bogotasegurainfo@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  
	# def weekly(email)
 #    mail to: email, subject: "RailsCasts Weekly"   
 #  end

  def weekly(subscriber)
    @url = "http://localhost:3000/"
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Bienvenido a Bogota Segura!')
  end

end
