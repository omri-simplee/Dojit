class CommentsController < ApplicationController
  def new
    @topic = Topic.find(:topic_id)
    @post = Post.find(:post_id)
    @comment = Comment.new
    @post.comment = @comment
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error while posting a new comment"
      redirect_to :new
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end