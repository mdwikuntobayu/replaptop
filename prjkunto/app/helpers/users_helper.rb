module UsersHelper
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        redirect_to root_url, :notice => "Signed up!"      
      else
        render "new"
      end
    else
      flash[:error] = "There was an error with the recaptcha code below. Please re-enter thecode and click submit"
      render "new"
    end
  end
end
