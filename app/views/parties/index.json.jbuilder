json.array!(@parties) do |party|
  json.extract! party, :id, :name, :category, :addinfo, :musicstyle, :night_house_id, partytime, partydate
  json.url party_url(party, format: :json)
end
