class SessionsController < ApplicationController
  def new
  end

  def destroy

  redirect_to "/"
  end 
  

  def create
    signin_params = params[:session]
    user=User.find_by_email(signin_params[:email].downcase)
    if user && user.authenticate(signin_params[:password])
      # sign_in user
      redirect_to user
    else
      # Create an error message and re-render the signin form.
      flash.now[:alert]='Invalid email/password combination'
      render 'new'
    end
   end 
end