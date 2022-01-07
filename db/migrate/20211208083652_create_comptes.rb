class CreateComptes < ActiveRecord::Migration[6.1]
  def change
    create_table :comptes do |t|
      t.integer :credits, default: 0
      t.integer :niveau

      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
