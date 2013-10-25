json.array!(@adword_auths) do |adword_auth|
  json.extract! adword_auth, :initiative_id, :access_token, :refresh_token, :issued_at, :expires_in
  json.url adword_auth_url(adword_auth, format: :json)
end
