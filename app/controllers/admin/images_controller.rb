class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: [:destroy]

  def index
    @images = Image.all
    @image = Image.new
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @images = Image.all

    @image.save
  end

  def destroy
    @image.destroy
    @images = Image.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:src)
  end
end
