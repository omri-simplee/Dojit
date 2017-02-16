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
  end

def create
    params2 = params[:post]
    @post = Post.new(:title=>params2[:title], :body=>params2[:body])
    # @post = Post.new(params2[:title], params2[:body])
    # @post = Post.new(params2.(:title, :body))
    # Rails.logger.debug(params.to_s)
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
