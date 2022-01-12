class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :compte, dependent: :destroy, autosave: true
  has_many :user_combats, dependent: :destroy
  has_many :combats, through: :user_combats
  has_many :bets

  after_create :create_compte

  def account_active?
    blocked_at.nil?
  end

  def login
    pseudo || email
  end

  private

    def create_compte
      Compte.create(credits: 0, niveau: 0, user_id: self.id)
    end
end
