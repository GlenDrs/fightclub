class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :compte, dependent: :destroy, autosave: true
  has_many :user_combats
  has_many :combats, through: :user_combats
  has_many :bets, dependent: :destroy 

  after_create :create_compte

  private

    def create_compte
      @compte = Compte.create(credits: 0, niveau: 0, user_id: self.id)
    end
end
