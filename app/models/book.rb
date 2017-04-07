class Book < ApplicationRecord
  include AASM

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true


  aasm do
    state :available, :initial => true
    state :unvailable, :cleaning

    event :rendered do
      transitions :from => :unvailable, :to => :available
    end

    event :borrowed do
      transitions :from => :available, :to => :unvailable
    end

  end
end
