module SessionsHelper
  def current_user
    return if session[:user_id] == nil
    current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
