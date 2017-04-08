class User < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :booking

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /([\w\.]+)@([\w\.]+)\.(\w+)/
end
