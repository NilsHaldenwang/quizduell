module PresentationHelper
  def team_sprite(answer)
    image_tag("team_sprite.png", class: "team_#{answer}")
  end

  def audience_sprite(answer)
    image_tag("audience_sprite.png", class: "audience_#{answer}")
  end

  def percentage_span(answer, percentage)
    content_tag(:span, "#{percentage}%", class: "#{answer}_percentage")
  end
end
