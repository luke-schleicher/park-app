class Park < ApplicationRecord

  has_many :park_players
  has_many :players, through: :park_players

  has_many :activity_parks
  has_many :activities, through: :activity_parks

end
