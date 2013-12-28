class LooksController < ApplicationController
  def index
    @looks = Look.all
    render json: @looks
  end
  
  def new
    @look = Look.new
    render :new
    
  end

  def create
    @look = Look.new(params[:look])
    
    @look.user_id = 1
    @look.url = @look.url || 'fasdfs'
    
    if @look.save
      redirect_to look_url(@look)
    else
      fail
    end
  end

  def show
    @look = Look.find(params[:id])
    render json: @look
  end
end
