class Look < ActiveRecord::Base
  attr_accessible :image, :user
  belongs_to :user
  mount_uploader :image, ImageUploader
end
