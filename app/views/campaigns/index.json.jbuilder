json.array!(@campaigns) do |campaign|
  json.extract! campaign, :initiative_id, :name, :status
  json.url campaign_url(campaign, format: :json)
end
