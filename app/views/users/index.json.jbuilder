json.array!(@users) do |user|
  json.extract! user, :email, :role
  json.url user_url(user, format: :json)
end
