class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :date, presence: :true
end
