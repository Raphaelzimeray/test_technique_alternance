class Player < ApplicationRecord
  belongs_to :team
  validates :name, presence: true
  validates :role, presence: true, inclusion: { in: %w(Heal Tank DPS) }
end
