class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def destroy
    plot_plant = PlotPlant.find_plot_plant(params).destroy
    redirect_to "/plots"
  end
end