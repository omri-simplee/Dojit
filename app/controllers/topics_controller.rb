class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  	authorize @topics
  end

  def new
  	@topic = Topic.new
  	authorize @topic
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts
  	authorize @topic
  end

  def edit
  	@topic = Topic.find(params[:id])
  	authorize @topic
  end

  def create
  	@topic = Topic.new(topic_params)
  	authorize @topic
  	if @topic.save!
  		redirect_to @topic, notice: "Topic was saved successfully."
		else
			flash[:error] = "Unable to create a new topic, please try again"
			render :new
		end
	end

	def update
		@topic = Topic.find(params[:id])
		authorize @topic
		if @topic.update_attributes(topic_params)
			redirect_to @topic
		else
			flash[:error] = "Unable to update topic, please try again"
			render :edit
		end
	end

  def destroy
    @topic = Topic.find(params[:topic_id])
    name = @topic.name
    authorize @topic
    if @topic.destroy!
      redirect_to @topic, notice: " \"#{name}\" was removed successfully." 
    else
      flash[:error] = "Unable to remove topic"
      render :show
    end
  end

	private
	
	def topic_params
		params.require(:topic).permit(:name, :description, :public)
	end
end
