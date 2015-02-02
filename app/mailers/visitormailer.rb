class VisitorMailer < ActionMailer::Base
  
	def newsletterconfirmation(visitormailer)
	  	@visitormailer = visitormailer
	  	mail(to: @visitormailer.email, subject 'Acacias for All - Confirmation d\'inscription à la Newsletter')
	end
end
