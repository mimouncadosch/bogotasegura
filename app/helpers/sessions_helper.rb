module SessionsHelper

	def sign_in(usuario)
		cookies.permanent[:remember_token] = usuario.remember_token
		current_usuario = usuario
	end

	def signed_in?
		!current_usuario.nil?
	end

	def current_usuario=(usuario)
		@current_usuario = usuario
	end

	def current_usuario
		@current_usuario ||= Usuario.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		current_usuario = nil
		cookies.delete(:remember_token)
	end

	def store_location
	    session[:return_to] = request.fullpath
	 end

	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end

	def signed_in_usuario
		unless signed_in?
	     	store_location
	      	redirect_to signin_path, notice: "Please sign in."
	    end
	end

end
