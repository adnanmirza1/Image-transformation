require "shrine"
require "image_processing/vips"

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :derivatives

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
else
  # Configure for production (e.g., S3)
end
