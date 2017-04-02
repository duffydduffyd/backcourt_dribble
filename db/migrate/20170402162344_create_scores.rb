class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
    t.integer :score
    t.integer :time
    t.integer :user_id
    t.integer :question_id

    t.timestamps
    end
  end
end
