class Admin::ArticlesController < Admin::ApplicationController
  before_filter :require_admin_login
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
      redirect_to  admin_articles_path
    else
      flash[:error] = 'Could not save article'
      @article = Article.find(:all)
      render new_admin_article
    end
  end

  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path
    else
      render edit_admin_article_path(params[:id])
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to admin_articles_path
  end
end
