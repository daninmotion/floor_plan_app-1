class FloorPlan < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :image, presence: true

  has_paper_trail

  def owner_name
    user.email.split('@')[0].split(/[._-]/).map(&:capitalize).join(' ')
  end
end
