class CreateCombats < ActiveRecord::Migration[6.1]
  def change
    create_table :combats do |t|
      t.string :name
      t.text :description
      t.string :winer

      t.timestamps
    end
  end
end
