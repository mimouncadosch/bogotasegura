module SesionesHelper
	
	def sign_in(subscriber)
		cookies.permanent[:remember_token] = subscriber.remember_token
		current_subscriber = subscriber
	end

	def signed_in?
		!current_subscriber.nil?
	end

	def current_subscriber=(subscriber)
		@current_subscriber = subscriber
	end

	def current_subscriber
		@current_subscriber ||= Subscriber.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		current_subscriber = nil
		cookies.delete(:remember_token)
	end
end
