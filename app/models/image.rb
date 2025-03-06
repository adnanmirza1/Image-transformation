class Image < ApplicationRecord
  include ImageUploader::Attachment(:file)
end
