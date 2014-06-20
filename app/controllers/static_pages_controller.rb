class StaticPagesController < ApplicationController
	def home
	end
	
	def presentations
	end

	def papers
	end

	def results
	end

	def help
	end

	def about
	end

	def index
	end

	def send_feedback
		email = params["/help"][:email]
		name = params["/help"][:name]
		content = params["/help"][:content]

		if FeedbackMailer.contactus(email,name,content).deliver
			flash[:form_success] = "Your E-Mail has been sent."
			render 'help'
		else
			flash[:form_errors] = "Your E-Mail failed to send."
			render 'help'
		end
	end
end
