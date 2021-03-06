class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      flash[:notice] = "Animal successfully added!"
      redirect_to animals_path
    else
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animals_path
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.sightings.each do |sighting|
      sighting.destroy
    end
    @animal.destroy
    redirect_to animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:species, :name, :gender, :image, :remove_image)
  end
end
