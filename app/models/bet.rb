class Bet < ApplicationRecord
  belongs_to :user_combats

  validates :sum_bet, presence: true
  validates :sum_bet, :numericality => { greater_than_or_equal_to: 5, less_than_or_equal_to: 100 }
end
