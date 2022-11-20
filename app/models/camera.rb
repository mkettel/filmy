class Camera < ApplicationRecord
  belongs_to :user
  has_many :rolls, dependent: :destroy
end
