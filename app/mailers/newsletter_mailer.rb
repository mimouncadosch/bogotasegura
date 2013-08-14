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

  def weekly(usuario)
    @url = "http://localhost:3000/"
    @usuario = usuario
    mail(to: @usuario.email_address, subject: 'Bienvenido a Bogota Segura!')
  end


  def report(usuario)
    @url = "http://localhost:3000/"
    @usuario = usuario
    mail(to: @usuario.email_address, subject: 'Un crimen ha sido reportado cerca de usted')
  end
  
end
