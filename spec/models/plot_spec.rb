require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many :plot_plants }
    it { should have_many(:plants).through(:plot_plants) }
  end

  before :each do
    @garden = Garden.create!(name: 'Buzzin Bees', organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: 'Large', direction: "South")
    @plot_2 = @garden.plots.create!(number: 2, size: 'Medium', direction: "East")

    @plant_1 = Plant.create!(name: 'Orange Flowers', description: 'Likes the sun', days_to_harvest: 30)
    @plant_2 = Plant.create!(name: 'Green Flowers', description: 'Doesnt likes the sun', days_to_harvest: 50)
    @plant_3 = Plant.create!(name: 'Blue Flowers', description: 'Likes rich soil', days_to_harvest: 110)
    @plant_4 = Plant.create!(name: 'Yellow Flowers', description: 'Likes dry soil', days_to_harvest: 10)

    @plot_plant_1 = PlotPlant.create!(plant_id: @plant_1.id, plot_id: @plot_1.id)
    @plot_plant_2 = PlotPlant.create!(plant_id: @plant_2.id, plot_id: @plot_1.id)
    @plot_plant_3 = PlotPlant.create!(plant_id: @plant_3.id, plot_id: @plot_2.id)
    @plot_plant_4 = PlotPlant.create!(plant_id: @plant_4.id, plot_id: @plot_2.id)
    @plot_plant_5 = PlotPlant.create!(plant_id: @plant_2.id, plot_id: @plot_2.id)
  end

  describe '#distinct_plant_names' do
    it 'returns plant names no duplicates, no plants days_to_harvest > 100' do
      expect(@garden.plots.distinct_plant_names).to eq([@plant_2.name, @plant_1.name, @plant_4.name])
    end
  end
end
