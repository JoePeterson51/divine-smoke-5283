class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    plant_names = @garden.plots.distinct_plant_names
    @plants = Plant.find_plants(plant_names)
    @sorted_plot_plant_ids = PlotPlant.plants_sorted_most_to_least
  end
end