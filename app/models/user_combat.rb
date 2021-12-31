class UserCombat < ApplicationRecord
  belongs_to :user
  belongs_to :combat
  
  validate :player_count_validation
  validate :unique_player

  private

  def player_count_validation
    if combat.user_combats.count >= 2
      errors.add(:combat,"must have length at most two")
    end
  end

  def unique_player
    if combat.user_combats.map {|uc| uc.user_id }.include?(user.id)
      errors.add(:user,"You can't fight yourself coco!")
    end
  end
end
