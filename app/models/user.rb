class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #User.includes(:combat).where(:users < 3) 
  
  #has_many :combats ,:through=> :user_combats
  has_one :compte 
  has_many :user_combats
  
end
