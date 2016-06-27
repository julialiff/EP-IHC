module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def checked_in?(party_id, user_id)
    @checkins = Checkin.all
    @checkins.each do |ck|
      if ck.party_id == party_id && ck.user_id == user_id
        # return ck
        return true
      end
    end
    return false
  end
end
