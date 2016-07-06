class InstagramService
  def authenticate(client_id, client_secret, code)
    resp = Faraday.post("https://api.instagram.com/oauth/access_token") do |req|
      req.body = "client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}&grant_type=authorization_code&redirect_uri='http://localhost:3000/auth'"
    end
    body = JSON.parse(resp.body)
    body["access_token"]
  end

  def posts(token)
    resp = Faraday.get("https://api.instagram.com/v1/tags/puppies/media/recent?access_token=#{token}")
    JSON.parse(resp.body)["data"]
  end
end