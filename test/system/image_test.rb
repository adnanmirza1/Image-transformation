require "application_system_test_case"

class ImagesTest < ApplicationSystemTestCase
  setup do
    @image = images(:one)
  end

  test "uploading an image" do
    visit new_image_path
    attach_file "File", Rails.root.join("test/fixtures/files/sample.jpg")
    click_on "Upload"

    assert_text "Image uploaded successfully."
  end

  test "compressing an image" do
    visit image_path(@image)
    click_on "Compress Image"
    assert_equal "image/jpeg", response.content_type
  end
end
