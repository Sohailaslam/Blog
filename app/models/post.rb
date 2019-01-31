class Post < ApplicationRecord
  
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  
end
