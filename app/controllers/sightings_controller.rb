class SightingsController < ApplicationController

  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new
    render :new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new(sighting_params)
    if @sighting.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    render :edit
  end

  def update
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

private
  def sighting_params
    params.require(:sighting).permit(:location, :date_sighted)
  end
end
