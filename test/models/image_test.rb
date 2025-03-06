require "test_helper"

class ImageTest < ActiveSupport::TestCase
  test "should not save image without file" do
    image = Image.new(name: "Test Image")
    assert_not image.save, "Saved the image without a file"
  end
end
