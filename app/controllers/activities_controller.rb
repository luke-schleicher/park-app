class ActivitiesController < ApplicationController

  def index
    @player = Player.find(params[:player_id])
    @activities = @player.activities
  end

end
