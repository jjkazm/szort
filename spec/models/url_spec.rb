require 'rails_helper'

RSpec.describe Url, type: :model do
  it "is invalid with empty address" do
    @url = Url.new(long:"")
    expect(@url).to_not be_valid
  end

  it "is invalid with short address" do
    @url = Url.new(long:"abc")
    expect(@url).to_not be_valid
  end

  it "accepts valid urls" do
    valid_urls = %w[ google.com https://google.com www.google.com yahoo.co.uk wp.pl]
    valid_urls.each do |url|
      @url = Url.new(long: url)
      expect(@url).to be_valid
    end
  end

  it "rejects invalid urls" do
    invalid_urls = %w[ wwwwwwwwwwwwwww https://googlecom www.google,com yahoo$.co.uk w@p.pl]
    invalid_urls.each do |url|
      @url = Url.new(long: url)
      expect(@url).to_not be_valid
    end
  end

end
