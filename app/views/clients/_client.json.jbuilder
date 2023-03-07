json.extract! client, :id, :name, :kind, :designed_by, :created_at, :updated_at
json.url client_url(client, format: :json)
