json.array!(@payment_apps) do |payment_app|
  json.extract! payment_app, :pay_service_id, :pay_service_type, :last_account_balance, :active
  json.url payment_app_url(payment_app, format: :json)
end
