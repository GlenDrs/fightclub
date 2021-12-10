class Combat < ApplicationRecord
  #has_many :users ,:through=> :user_combats
  has_many :user_combats
end
