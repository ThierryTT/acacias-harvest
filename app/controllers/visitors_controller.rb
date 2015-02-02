class VisitorsController < ApplicationController

	def create
	    @visitor = Visitor.new(visitor_params)
	    if @visitor.save
	        VisitorMailer.newsletterconfirmation(@visitor).deliver
	      	flash[:success] = 'Un Email de confirmation vient de vous être envoyé'
	    else
	      	flash[:failure] = 'L\'Email de confirmation n\'a pas pu être envoyé, merci de vérifier votre adresse'
	    end
	    redirect_to @visitormailer
	end

	private
	def visitor_params
		params.require(:visitor).permit(:email)
	end

end