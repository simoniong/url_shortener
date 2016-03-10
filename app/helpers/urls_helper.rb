module UrlsHelper
  def display_shorten_url(url)
    request.base_url + "/" + url.token
  end

  def tokened_shorten_url_path(url)
    url_path(id: url.token)
  end
end
