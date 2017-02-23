class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
      http_params = params[:post]
      @post = current_user.posts.build(params.require(:post).permit(:title, :body))
      # @post = Post.new(:title=>http_params[:title], :body=>http_params[:body])
      if @post.save
        flash[:notice] = "Post was saved."
        redirect_to @post
      else
        flash[:error] = "There was an error saving the post. Please try again."
        render :new
      end
  end

  def update
    http_params = params[:post]
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post]) #Equals to update_attribute(:body => http_params[:post][:title])
      flash[:notice] = "Post was updated"
      redirect_to @post
    else
      flash[:notice] = "There was an error editing the post, Please try again"
      render :edit
    end
  end
end
