class Player < ApplicationRecord

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

end
