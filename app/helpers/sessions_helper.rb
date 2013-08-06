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

end
