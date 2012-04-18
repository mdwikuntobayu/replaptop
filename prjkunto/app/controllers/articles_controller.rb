class ArticlesController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :validate_user, :only => [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
    @comments = @article.comments 
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      flash[:error] = 'Could not save article'
      @article = Article.find(:all)
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to articles_path
    else
      render :action => :edit
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private
  def validate_user()
    @article = Article.find_by_id(params[:id])
    if @article.user_id == current_user.id
    else
      flash[:error] = "You cannot access another article"
      redirect_to(:back)
    end
  end  

end
