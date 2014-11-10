desc "Generates some answers for the current question with different IPs"
task :generate_answers => :environment do
  cq = GameState.instance.current_question

  50.times do |i|
    ["A", "B", "C", "D"].each do |value|
      if rand > 0.3
        cq.answers.create(value: value, ip: "#{i}-#{value}")
      end
    end
  end
end

desc "Generate answers for testing the winner function"
task :winner_data  => :environment do
  Question.all.each do |q|
    q.answers.create(value: q.correct_answer, ip: "42")
    q.answers.create(value: "A", ip: "2")
    q.answers.create(value: "B", ip: "3")
    q.answers.create(value: "C", ip: "4")
    q.answers.create(value: q.correct_answer, ip: "73")
    q.answers.create(value: "D", ip: "5")
    q.answers.create(value: q.correct_answer, ip: "23")
  end
end
