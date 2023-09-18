module ApplicationHelper
  def display_with_image(icon)
    image_tag(icon.to_s, class: 'border border-black') if icon.present?
  end
end
