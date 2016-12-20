class SessionController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @player = Player.find_by_email(params[:email])
    if @player && @player.authenticate(params[:password])
      sign_in(@player)
      flash[:success] = "Welcome!"
      redirect_to @player
    else
      flash[:error] = "Couldn't log in"
      redirect_to :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out"
    redirect_to root
  end

end
