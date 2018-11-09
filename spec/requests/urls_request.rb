require "rails_helper"

RSpec.describe "Urls", type: :request do
  before do
    @url = Url.create(long: "bbc.co.uk", short: "a1b2c3d4")
  end

  describe 'GET/done/:short' do

    context 'with existing url' do
      it "returns specific page" do
        get "/done/#{@url.short}"
        expect(response.status).to eq 200
      end
    end

    context 'with non-existing url' do
      it 'handles non-existing url' do
        get "/done/xxxxxxxx"
        expect(response.status).to eq 302
      end
    end
  end

  describe 'GET/' do
    context 'with valid url' do
      it 'renders home page' do
        get "/"
        expect(response.status).to eq 200
      end
    end

    context 'with random invalid url' do
      it 'redirects to home page' do
        get "/invalid_url"
        expect(response.status).to eq 302  
      end


    end
  end



end
