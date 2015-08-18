class FloorPlan < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
end
