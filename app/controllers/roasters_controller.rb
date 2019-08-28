class RoastersController < ApplicationController

  def index
    @roasters = Roaster.all
    @user = find_user(session[:user_id])
  end

  def new
    @roaster = Roaster.new
    @user = find_user(session[:user_id])
  end

  def show
    @roaster = Roaster.find_by(:id => params[:id])
    @user = find_user(session[:user_id])
  end

  def edit
    @roaster = Roaster.find_by(:id => params[:id])
    @user = find_user(session[:user_id])
  end

  def update
    roaster = Roaster.find_by(:id => params[:id])
    roaster.update(roasters_params)

    redirect_to roaster_path(roaster)
  end

  def create
    @user = find_user(session[:user_id])
    @roaster = Roaster.new(roasters_params)
    
    if !@roaster.save
      render 'new'
    else
      redirect_to roaster_path(@roaster)
    end
  end

  private

  def roasters_params
    params.require(:roaster).permit(:name, :location)
  end

end
