class Roll < ApplicationRecord
  belongs_to :camera
  has_many :rolls
  has_many :frames
end
