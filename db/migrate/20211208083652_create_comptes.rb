class CreateComptes < ActiveRecord::Migration[6.1]
  def change
    create_table :comptes do |t|
      t.integer :credits
      t.integer :niveau

      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
