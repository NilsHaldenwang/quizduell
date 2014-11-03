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
