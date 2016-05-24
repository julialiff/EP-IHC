module NightHousesHelper
  def gravatar_for(night_house)
    gravatar_id = Digest::MD5::hexdigest(night_house.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: night_house.name, class: "gravatar")
  end
end
