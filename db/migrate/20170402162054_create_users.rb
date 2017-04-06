class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_hash, null: false

      t.timestamps
    end
  end
end
