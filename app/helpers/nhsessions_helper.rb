module NhsessionsHelper
  def nhlog_in(nightHouse)
    session[:nightHouse_id] = nightHouse.id
  end

  # Returns the current logged-in user (if any).
  def current_nh
    @current_nh ||= NightHouse.find_by(id: session[:nightHouse_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def nhlogged_in?
    !current_nh.nil?
  end

  def nhlog_out
    session.delete(:nightHouse_id)
    @current_nh = nil
  end
end
