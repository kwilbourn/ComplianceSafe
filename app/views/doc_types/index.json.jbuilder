json.array!(@doc_types) do |doc_type|
  json.extract! doc_type, :id, :description, :issuing_authority, :area_id
  json.url doc_type_url(doc_type, format: :json)
end
