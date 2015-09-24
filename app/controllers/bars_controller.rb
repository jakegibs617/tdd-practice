class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @reviews = @bar.reviews
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar =Bar.new(bar_params)

    if @bar.save
      redirect_to @bar, notice: "New Bar"
    else
      render action: 'new'
    end
  end

  private

  def bar_params
    params.require(:bar).permit(:title, :address, :city, :state, :zip_code, :description, :price_range)
  end
end
