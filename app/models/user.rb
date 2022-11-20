class User < ApplicationRecord
  has_many :cameras, dependent: :destroy
  has_many :rolls, through: :cameras
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
