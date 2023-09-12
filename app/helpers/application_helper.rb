module ApplicationHelper
  def display_with_image(icon)
    image_tag("#{icon}", class: 'border border-black') if icon.present?
  end
end
