class Activity < ApplicationRecord

  has_many :activity_players
  has_many :players, through: :activity_players

  def display_activity
    self.name.gsub('_', ' ').titleize
  end

end
