require "addressable/uri"

module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    uri = Addressable::URI.parse(gravatar_url)
    uri.query_values = {:s => size.to_s}
    gravatar_url = uri.to_s
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
