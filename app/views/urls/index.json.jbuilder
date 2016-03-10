json.array!(@urls) do |url|
  json.extract! url, :id, :shorten_url, :origin_url, :token, :count
  json.url url_url(url, format: :json)
end
