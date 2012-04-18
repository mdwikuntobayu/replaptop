class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      if user.is_admin? 
        redirect_to admin_articles_path
      else
        redirect_to root_url, :notice => "Logged in!"
      end
    else
      flash.now.alert = "invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end  
end
