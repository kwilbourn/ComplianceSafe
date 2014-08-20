json.array!(@areas) do |area|
  json.extract! area, :id, :description, :identifier
  json.url area_url(area, format: :json)
end
