class ParksController < ApplicationController

  def index
    @player = Player.find(params[:player_id])
    @activities = @player.activities
    @parks = @player.parks    
  end

  def show
    @park = Park.find(params[:id])
  end

end
