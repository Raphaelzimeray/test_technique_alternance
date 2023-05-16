class Player < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :role, presence: true
  ROLES_LIST = ["Heal", "Tank", "DPS"]
end
