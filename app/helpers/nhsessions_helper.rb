module NhsessionsHelper
  def nhlog_in(nightHouse)
    session[:nightHouse_id] = nightHouse.id
  end
end
