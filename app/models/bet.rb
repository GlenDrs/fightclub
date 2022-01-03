class Bet < ApplicationRecord
  belongs_to :user_combat

  validates :sum_bet, presence: true

  validates_numericality_of :sum_bet, :greater_than_or_equal_to => 5, 
    :less_than_or_equal_to => 100
   #validates :sum_bet >= current_user.compte.credits #, message: "You have not enough credits" 
end     
