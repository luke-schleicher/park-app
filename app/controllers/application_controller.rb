class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  def sign_in(player)
    player.regenerate_auth_token
    cookies[:auth_token] = player.auth_token
    @current_player = player
  end

  def sign_out
    @current_player = nil
    cookies.delete(:auth_token)
  end

  def current_player
    @current_player ||= Player.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_player

  def signed_in_player?
    !!current_player
  end
  helper_method :signed_in_player?

  def require_login
    unless signed_in_player?
      flash[:error] = "Sign in first"
      redirect_to root_path
    end
  end

end
