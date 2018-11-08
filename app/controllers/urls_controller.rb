class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
  end

  def show
    @url = Url.find_by(short: params[:short])
    redirect_to "https://#{@url.long}"
  end

  def done
  end

  private
    def url_params
      params.require(:url).permit(:long)
    end

end
