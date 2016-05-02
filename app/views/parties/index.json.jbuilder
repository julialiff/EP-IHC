json.array!(@parties) do |party|
  json.extract! party, :id, :name, :category, :add_info, :music_style, :NightHouse_id
  json.url party_url(party, format: :json)
end
