class Player < ApplicationRecord
  belongs_to :team

  validates :name, presence: true
  validates :post, presence: true
  LISTE_POSTE = ["Heal", "Tank", "DPS"]
end
