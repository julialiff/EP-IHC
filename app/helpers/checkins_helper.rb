module CheckinsHelper
  def count_checkin(party_id)
    return Checkin.where(:party_id => party_id).count
  end
end
