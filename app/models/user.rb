class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities
  has_many :groups

  validates :name, presence: true, length: { in: 1..50 }
end
