json.extract! client, :id, :senha, :verificado, :user_id, :created_at, :updated_at
json.url client_url(client, format: :json)
