class Question < ActiveRecord::Base
  has_many :answers

  def was_answered_by?(ip)
    answers.where(ip: ip).first
  end

  def was_answered_by!(value, ip)
    if ip =~ Resolv::IPv4::Regex
      answers.create({value: value, ip: ip})
    end
  end

  def compute_audience_answer!
    if answers.count == 0
      ["A", "B", "C", "D"].shuffle.each do |value|
        answers.create(ip: "42", value: value)
      end
    end

    answer = answers.group(:value).count.max_by { |k, v| v}.first
    self.update_attribute(:audience_answer, answer)
    answer
  end
end
