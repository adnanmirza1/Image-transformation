class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image), notice: 'Image uploaded successfully.'
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def compress
    @image = Image.find(params[:id])
    compression_quality = params[:quality].to_i

    # Ensure the compression quality is within a valid range (1-100)
    compression_quality = [1, compression_quality, 100].sort[1]

    # Process the image with the specified compression quality
    @image.file_attacher.create_derivatives(compression_quality: compression_quality)
    @image.save
    @compressed_image_url = @image.file_derivatives[:compressed].url
    render :compress
  end

  def convert_to_png
    @image = Image.find(params[:id])
    @image.file_derivatives!
    @png_image_url = @image.file_derivatives[:png].url
    render :convert_to_png
  end

  def convert_to_bw
    @image = Image.find(params[:id])
    @image.file_derivatives!
    @bw_image_url = @image.file_derivatives[:bw].url
    render :convert_to_bw
  end

  private

  def image_params
    params.require(:image).permit(:name, :file)
  end
end
