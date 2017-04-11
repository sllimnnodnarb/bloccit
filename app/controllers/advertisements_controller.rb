class AdvertisementsController < ApplicationController

  before_action :set_topic

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = @topic.advertisements.new(advertisement_params)

    if @advertisement.save
      flash[:notice] = "Advertisement was saved."
      redirect_to [@advertisement.topic, @advertisement]
    else
      flash.now[:alert] = "There was an error saving the Advertisement. Please try again."
      render :new
    end
  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    @advertisement = Advertisement.find(params[:id])

    if @advertisement.update_attributes(advertisement_params)
      flash[:notice] = "Advertisement was updated."
      redirect_to [@advertisement.topic, @advertisement]
     else
      flash.now[:alert] = "There was an error saving the advertisement. Please try again."
      render :edit
     end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])

    if @advertisement.destroy
      flash[:notice] = "\"#{@advertisement.title}\" was deleted successfully."
      redirect_to @advertisement.topic
    else
      flash.now[:alert] = "There was an error deleting the advertisement."
      render :show
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def advertisement_params
    params.require(:advertisement).permit(:title, :body, :price)
  end
end
