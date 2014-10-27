class CreateGameStates < ActiveRecord::Migration
  def change
    create_table :game_states do |t|
      t.integer :points_team
      t.integer :points_audience
      t.string :state
      t.integer :current_question_number

      t.timestamps
    end
  end
end
