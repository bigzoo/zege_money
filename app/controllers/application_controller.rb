class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def signed_in
    if !user_signed_in?
      flash[:alert]='Please Sign In First!'
      redirect_to new_user_session_path(after:'dashboard')
    end
  end
end
