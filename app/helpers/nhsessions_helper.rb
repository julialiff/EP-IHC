module NhsessionsHelper
  def log_in_nh(nightHouse)
    nhsession[:nightHouse_id] = nightHouse.id
  end
end
