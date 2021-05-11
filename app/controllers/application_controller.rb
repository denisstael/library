class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_logged_in_user
    unless user_signed_in?
      flash[:danger] = 'Por favor, realize o login'
      redirect_to login_path
    end
  end
end
