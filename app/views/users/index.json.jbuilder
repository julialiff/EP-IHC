json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :cellphone, :photo, :birthdate, :occupation, :college, :state, :city, :neighbourhood
  json.url user_url(user, format: :json)
end
