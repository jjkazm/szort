class UrlsController < ApplicationController
  include UrlsHelper
  before_action :set_url, only:[:show, :done]

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if already_in_db(unify_link(@url.long))
      @url2 = Url.find_by(long: unify_link(@url.long))
      redirect_to done_path(@url2.short)
    else
      @url.short = generate_uniq_link
      if @url.save
        redirect_to done_path(@url.short)
      else
        render 'new'
      end
    end
  end

  def show
    @url = Url.find_by(short: params[:short])
    redirect_to "http://#{@url.long}"
  end

  def done
    @url = Url.find_by(short: params[:short])
  end

  protected
    def resource_not_found
      redirect_to root_path
    end

  private
    def url_params
      params.require(:url).permit(:long, :short)
    end

    def set_url
      Url.find_by(short: params[:short])
    end

end
