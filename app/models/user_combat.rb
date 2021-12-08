class UserCombat < ApplicationRecord
  belongs_to :user
  belongs_to :combat
end
