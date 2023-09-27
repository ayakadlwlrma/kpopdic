class Image < ApplicationRecord
  belongs_to :post
  mount_uploader :photo, PhotoUploader
end
