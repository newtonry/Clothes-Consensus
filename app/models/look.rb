class Look < ActiveRecord::Base
  attr_accessible :image, :user
  
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  
  mount_uploader :image, ImageUploader
end
