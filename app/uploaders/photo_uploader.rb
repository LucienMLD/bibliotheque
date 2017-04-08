class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  resize_to_fit 150, 150
end
