json.array!(@documents) do |document|
  json.extract! document, :id, :name, :permit_number, :expiration_date, :created, :modified, :type_ID, :user_ID
  json.url document_url(document, format: :json)
end
