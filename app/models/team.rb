class Team < ApplicationRecord
  has_many :players

  validates :name, presence: true, length: { maximum: 50 }
  validates :city, presence: true
  validates :players, length: { maximum: 11 }
end

class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :city, presence: true
end
