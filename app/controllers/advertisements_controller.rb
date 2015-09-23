class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
# #9
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

# #10
    if @advertisement.save
# #11
      flash[:notice] = "Advertisement was saved."
      redirect_to @advertisement
    else
# #12
      flash[:error] = "There was an error saving the advertisement. Please try again."
      render :new
    end

  end
end
