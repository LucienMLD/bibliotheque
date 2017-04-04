class Book < ApplicationRecord
  belongs_to :booking

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true

  include AASM

  aasm do
    state :avalaible, :initial => true
    state :unvailable, :cleaning

    event :rendered do
      transitions :from => :unvailable, :to => :avalaible
    end

    event :borrowed do
      transitions :from => :avalaible, :to => :unvailable
    end

  end
end
