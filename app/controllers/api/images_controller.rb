require 'faraday'
class Api::ImagesController < ApplicationController
  # before_action :set_image, only: [:show, :update, :destroy]


  # ## GET search results from external APIs of Unsplash, Pexels, and Pixabay
  # # Return a JSON object containing the Array of Photos
  # def external
  #   url = `https://api.unsplash.com/search/photos?client_id=#{UNSPLASH_ACCESS_KEY}&page=#{1}&query=#{husky}&per_page=10`

  # conn = Faraday.new(url: url) do |faraday|
  #   faraday.adapter Faraday.default_adapter
  #   faraday.response :json
  # end

  # response = conn.get('search', type: 'artist', q: 'tycho')
  # response.body
  # render json: {:route => "working"}
  # end

  # GET /images
  def index
    puts params
    if params[:search].present?
      if Image.where(src: params[:search]).exists?
        @image = Image.where(src: params[:search])
        puts @image
        render json: @image
      else
        render json: { :message => "not found"}
      end
    else
      @images = Image.all
      render json: @images
    end    
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:height, :key, :metadata, :width, :src, :download_count)
    end
end
