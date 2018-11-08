module UrlsHelper

  # Generates 8-character link
  def generate_link
    (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).sample(8).join
  end

  # Checks if url is already in database
  def already_in_db(string)
    !!Url.find_by(long: string)
  end

end
