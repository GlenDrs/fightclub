class CreateUsersCombatsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :combat
  end
end
