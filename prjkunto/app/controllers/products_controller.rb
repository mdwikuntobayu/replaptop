class ProductsController < ApplicationController
  before_filter :validate_user, :only => [:edit, :update, :destroy]
  
  def index
    @products = Product.limit(2) 
  end

  def show
    @product = Product.find_by_id(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id
      if @product.save
        redirect_to products_path      
      else
        render "new"
      end
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_path
    else
      render :action => :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path
  end

  private
  def validate_user()
    @product = Product.find_by_id(params[:id])
    if @product.user_id == current_user.id
    else
      flash[:error] = "You cannot access another article"
      redirect_to(:back)
    end
  end  

end
