class SesionesController < ApplicationController
  def new
  end

  def create
    subscriber = Subscriber.find_by_email(params[:sesione][:email]) 
    if subscriber && subscriber.authenticate(params[:sesione][:subscriber_password])
      sign_in subscriber
      redirect_to subscriber
    else
      flash.now[:error] = 'Invalid email/password combination'    
      render 'new' 
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
