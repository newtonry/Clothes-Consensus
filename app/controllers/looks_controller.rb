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
    fail
  end

  def show
    @look = Look.find(params[:id])
    render json: @look
  end
end
