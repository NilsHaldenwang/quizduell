# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require Rails.root.join("config", "initializers", "active_record.rb")

GameState.create(points_team: 0, points_audience: 0, current_question_number: 0, state: GameState::STATE_STARTING)

Question.create(number: 1, correct_answer: "A")
Question.create(number: 2, correct_answer: "B")
Question.create(number: 3, correct_answer: "C")
