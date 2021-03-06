class SightingsController < ApplicationController

  def report
    @start_date = Date.parse( params["report"]["start_date"])
    @end_date = Date.parse( params["report"]["end_date"])
    @sightings = Sighting.report(@start_date, @end_date)
    render :index
  end

  def index
    @sightings = Sighting.all
  end

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

  def destroy
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.find(params[:id])
    @sighting.destroy
    redirect_to animal_path(@animal)
  end

private
  def sighting_params
    params.require(:sighting).permit(:location, :date_sighted, :region_id)
  end
end
