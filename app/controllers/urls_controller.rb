class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.order("created_at desc").all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    if @url.present?
      @url.increment!(:count)
      redirect_to @url.origin_url, status: 301
    else
      redirect_to urls_path, notice: "Such url not found!"
    end
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)
    respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        format.json { head :ok }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.where(token: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:origin_url, :token)
    end
end
