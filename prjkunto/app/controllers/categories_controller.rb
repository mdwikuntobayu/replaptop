class CategoriesController < ApplicationController
  
  before_filter :require_admin_login, :only => [:edit, :update, :destroy]  

  def index
    @categories = Category.all 
  end

  def show
    @category = Category.find_by_id(params[:id])
  end
  
  def new
    if current_user.nil? || !current_user.is_admin?
      flash[:error] = "Only admins are permitted"
      redirect_to log_in_path
    else
      @category = Category.new
      return current_user
    end
   
  end

  def create
    @category = Category.new(params[:category])
      if @category.save
        redirect_to categories_path      
      else
        render "new"
      end
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def update
    @category = Category.find_by_id(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path
    else
      render :action => :edit
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end
  
end
