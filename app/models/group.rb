class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities

  validates :name, presence: true, length: { in: 1..50 }
  validates :icon, presence: true, length: { in: 1..500 }
end
