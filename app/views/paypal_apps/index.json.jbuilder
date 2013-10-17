json.array!(@paypal_apps) do |paypal_app|
  json.extract! paypal_app, :client_id, :client_secret, :username, :app_id, :password, :signature
  json.url paypal_app_url(paypal_app, format: :json)
end
