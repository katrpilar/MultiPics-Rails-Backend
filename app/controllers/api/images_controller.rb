class Api::ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  # GET /images
  def index
    puts params
    if params[:search].present?
      if Image.where(download: params[:search]).exists?
        @image = Image.where(download: params[:search])
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
      params.require(:image).permit(:link, :brand, :photographer, :profile, :download, :download_count, :search)
    end
end
