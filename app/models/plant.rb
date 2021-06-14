class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.find_plants(plant_names)
    Plant.where(name: plant_names)
  end
end