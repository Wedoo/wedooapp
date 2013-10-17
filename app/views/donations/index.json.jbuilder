json.array!(@donations) do |donation|
  json.extract! donation, :initiative_id, :paymentaccount_id, :amount
  json.url donation_url(donation, format: :json)
end
