class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.integer :sum_bet  

      t.belongs_to :user_combat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
