class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :correct_answer
      t.string :team_answer
      t.string :audience_answer

      t.timestamps
    end
  end
end
