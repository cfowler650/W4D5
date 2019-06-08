class SessionsController < ApplicationController
  def new 
    render :new
  end 

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )

      if @user 
        succesful_log_in!(@user)
        redirect_to user_url(@user)
      else  
        flash.now[:errors] = @user.errors.full_messages
        render :new 
      end
  end 

  def destroy 
    log_out!
  end
end
