class UserCombat < ApplicationRecord
  belongs_to :user
  belongs_to :combat

  #validates_uniqueness_of :combat_id, :scope => :user_id
  validate :player_count_validation

  private

  def player_count_validation
    if combat.user_combats.count >= 2
      errors.add(:combat,"must have length at most two")
    end
  end
end
