class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #User.includes(:combat).where(:users < 3) 
  
  #has_many :combats ,:through=> :user_combats
  has_one :compte, dependent: :destroy, autosave: true
  has_many :user_combats
  has_many :combats, through: :user_combats

  after_create :create_compte

  private

    def create_compte
      @compte = Compte.create(credits: 0, niveau: 0, user_id: self.id)
    end
end
