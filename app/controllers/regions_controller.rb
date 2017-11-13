class RegionsController < ApplicationController
  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:notice] = "Region successfully added!"
      redirect_to regions_path
    else
      render :new
    end
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      redirect_to regions_path
    else
      render :edit
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.sightings.each do |sighting|
      sighting.destroy
    end
    @region.destroy
    redirect_to regions_path
  end

  def show
    @region = Region.find(params[:id])
  end

private
  def region_params
    params.require(:region).permit(:name)
  end
end
