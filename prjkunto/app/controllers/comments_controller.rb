class CommentsController < ApplicationController
   def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.article_id = @comment.article.id

    #@comments = Comment.where("article_id=#{@comment.article_id}")
    #@comment.save
    #  redirect_to article_path(@comment.article_id)
    #else
    # flash[:error] = 'Could not save article'
    #  redirect_to article_path(@comment.article_id)      
    #end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(article_path(article), :notice => 'Comment was successfully created.') }
        format.js
      end
    end

  end

end
