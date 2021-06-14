class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plot_plants
  has_many :plants, through: :plot_plants

  def self.distinct_plant_names
    joins(:plants).select("plants.*").where("days_to_harvest < 100").distinct.pluck(:name)
  end
end
