class ImageUploader < Shrine
  plugin :processing
  plugin :versions
  plugin :validation_helpers

  Attacher.derivatives do |original, **options|
    compression_quality = options[:compression_quality] || 80

    vips = ImageProcessing::Vips.source(original)
    {
      compressed: vips.saver(quality: compression_quality).call,
      png: vips.convert!("png"),
      bw: vips.colourspace!("b-w")
    }
  end
end
