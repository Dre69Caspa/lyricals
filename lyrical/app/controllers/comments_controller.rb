class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comment =Comment.new
  end

  def index
    @comments = Comment.all
  end

	def create
	  @comment = Comment.create(comment_params)
	  @comment.article_id = params[:article_id]

	  @comment.save

	  redirect_to article_path(@comment.article)
	end

  #def update
   # @comment = Comment.find(params[:id])
   # @comment.update(comment_params)
   # flash.notice = "Comment updated!"
  #  redirect_to comments_path(@comment)
 # end

	def comment_params
	  params.require(:comment).permit(:author_name, :body)
	end
end
