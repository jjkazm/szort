module UrlsHelper

  # Generates 8-character link
  def generate_link
    (("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a).sample(8).join
  end

  # Checks if url is already in database
  def already_in_db(string)
    !!Url.find_by(long: string)
  end

  # Prepares original link to be saved in database
  def unify_link(s)
   s = s.downcase.sub(/^https?\:\/\//, '').sub(/^www./,'').sub(/^http?\:\/\//, '')
 end

 # Sets up url depending on Rails environment
 def base_url
   if Rails.env.development? || Rails.env.test?
     "http://localhost:3000/"
   else
     "https://szort.herokuapp.com/"
   end
 end
end
