class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.string :making_bet
      t.integer :sum_bet  

      t.timestamps
    end
  end
end
