json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :client_code, :subdomain
  json.url account_url(account, format: :json)
end
