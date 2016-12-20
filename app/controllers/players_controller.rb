class PlayersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(whitelisted_create_params)
    if @player.save
      sign_in(@player)
      flash[:success] = "Player created"
      redirect_to edit_player_path(@player)
    else
      flash.now[:error] = @player.errors.full_messages
      render :new
    end
  end

  def edit
    @player = current_player
    @activities = Activity.all
  end

  def update
  end

  private

  def whitelisted_create_params
    params.require(:player).permit(:first_name, :last_name, :nick_name, :email, :password, :password_confirmation, :zip)
  end

  def whitelisted_update_params
  end

end
