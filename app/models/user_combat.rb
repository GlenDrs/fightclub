class UserCombat < ApplicationRecord
  belongs_to :user
  belongs_to :combat

  validate :player_count_validation

  private 

    def player_count_validation
      if users.length > 2
        errors.add(:users, "must have length at most two")
      end
    end
  
end
