module ApplicationHelper
  def show_message(message)
    content_tag(:div, class: "alert alert-danger") do
      message
    end
  end

  def message_type(type)
    
  end
end
