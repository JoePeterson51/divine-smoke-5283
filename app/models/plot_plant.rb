class PlotPlant < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.find_plot_plant(params)
    where(plot_id: params[:id], plant_id: params[:plant_id])[0]
  end

  def self.plants_sorted_most_to_least
    require 'pry'; binding.pry
  end
end