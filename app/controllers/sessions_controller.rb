class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
   	if user && user.authenticate(params[:session][:password])
   		#log the user in
   		log_in user
   		redirect_to user
   	else
   		#show error messages
   		flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
  	render 'new'
  end
end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end
