json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :cellphone, :photo, :birth_date, :occupation, :college, :state, :city, :neighbourhood
  json.url user_url(user, format: :json)
end
