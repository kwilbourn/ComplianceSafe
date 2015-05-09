json.array!(@doc_categories) do |doc_category|
  json.extract! doc_category, :id, :name, :id, :account_id
  json.url doc_category_url(doc_category, format: :json)
end
