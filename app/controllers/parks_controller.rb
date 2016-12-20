class ParksController < ApplicationController

  def index
    @player = Player.find(params[:player_id])
    @parks = @player.parks    
  end

end
