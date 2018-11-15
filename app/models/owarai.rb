class Owarai < ApplicationRecord
  belongs_to :user
  
  mount_uploader :image, ImagesUploader
  validates :content, presence: true, length: { maximum: 255 }
end
