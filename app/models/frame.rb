class Frame < ApplicationRecord
  belongs_to :roll
  has_one_attached :photo
end
