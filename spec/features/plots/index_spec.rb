require 'rails_helper'

RSpec.describe 'index' do
  before :each do
    @garden = Garden.create!(name: 'Buzzin Bees', organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: 'Large', direction: "South")
    @plot_2 = @garden.plots.create!(number: 2, size: 'Medium', direction: "East")

    @plant_1 = Plant.create!(name: 'Orange Flowers', description: 'Likes the sun', days_to_harvest: 30)
    @plant_2 = Plant.create!(name: 'Green Flowers', description: 'Doesnt likes the sun', days_to_harvest: 50)
    @plant_3 = Plant.create!(name: 'Blue Flowers', description: 'Likes rich soil', days_to_harvest: 70)
    @plant_4 = Plant.create!(name: 'Yellow Flowers', description: 'Likes dry soil', days_to_harvest: 10)

    @plot_plant_1 = PlotPlant.create!(plant_id: @plant_1.id, plot_id: @plot_1.id)
    @plot_plant_2 = PlotPlant.create!(plant_id: @plant_2.id, plot_id: @plot_1.id)
    @plot_plant_3 = PlotPlant.create!(plant_id: @plant_3.id, plot_id: @plot_2.id)
    @plot_plant_4 = PlotPlant.create!(plant_id: @plant_4.id, plot_id: @plot_2.id)
  end

  it 'shows all the plots numbers and their plants' do
    visit '/plots'

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_content(@plant_4.name)
  end

  it 'can remove plants from the plots without deleting the plant record' do
    visit '/plots'

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_content(@plant_4.name)
    expect(Plant.all.count).to eq(4)

    click_link "Remove #{@plant_1.name}"

    expect(page).to_not have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_content(@plant_4.name)
    expect(Plant.all.count).to eq(4)
  end
end