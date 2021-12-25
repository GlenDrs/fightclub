class Combat < ApplicationRecord

  has_many :user_combats
  has_many :users, through: :user_combats

end
