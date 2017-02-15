class SessionsController < ApplicationController
  skip_before_action :check_logged_in
  protect_from_forgery except: [:create]

  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to books_url
  end

  def destroy
    session.destroy
    redirect_to root_url
  end

  protected
    def auth_hash
      request.env['omniauth.auth']
    end
end
