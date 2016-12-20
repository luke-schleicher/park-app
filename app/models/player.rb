require 'api'

class Player < ApplicationRecord

  after_create :generate_activities
  after_update :generate_favorite_parks

  before_create :generate_token

  has_secure_password

  has_many :activity_players
  has_many :activities, through: :activity_players

  has_many :park_players
  has_many :parks, through: :park_players

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while Player.exists?(auth_token: self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  private

  def generate_activities
    if Activity.none?
      Socrata_API.generate_activities
    end
  end

  def generate_favorite_parks

    self.parks.destroy_all

    self.activities.each do |activity|

      returned_parks = Socrata_API.query(activity.name)

      returned_parks.each do |park|

        p = Park.find_or_create_by(name: park[:park_name], number: park[:park_number], street_address: park[:street_address], zip: park[:zip], acres: park[:acres], ward: park[:ward])

        self.parks << p unless self.parks.include?(p)

        a = Activity.find_or_create_by(name: activity.name)

        p.activities << a unless p.activities.include?(a)

      end

    end

  end

end
