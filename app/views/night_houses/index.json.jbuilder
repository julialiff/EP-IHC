json.array!(@night_houses) do |night_house|
  json.extract! night_house, :id, :name, :cnpj, :email, :category, :state, :city, :neighbourhood, :address
  json.url night_house_url(night_house, format: :json)
end
