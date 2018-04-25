class Shift < ApplicationRecord
  belongs_to :shiftweek
  has_many :breaks, dependent: :destroy
end
