class UsersController < ApplicationController
  before_filter :validate_user, :only => [:edit, :update, :destroy]

  def index
    @users = User.all
    @products = Product.order("id DESC").limit(2)
    @articles = Article.all    
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    #if verify_recaptcha
      if @user.save
        #UserMailer.registration_confirmation(@user).deliver
        redirect_to root_url, :notice => "Signed up!"      
      else
        render "new"
      end
    #else
    #  flash[:error] = "There was an error with the recaptcha code below. Please re-enter thecode and click submit"
    #  render "new"
    #end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render :action => :edit
    end
  end

  private
  def validate_user()
    @user = User.find_by_id(params[:id])
    if @user.id == current_user.id
    else
      flash[:error] = "You cannot access another user"
      redirect_to(:back)
    end
  end  

end
