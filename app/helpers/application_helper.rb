module ApplicationHelper
  def show_message(message)
    content_tag(:div, class: "alert alert-danger") do
      message
    end
  end

  def message_type(type)
    
  end

  def message_class_for(type)
    { success: 'alert-success', error: 'alert-danger', 'notice': 'alert-warning' }[type.to_sym]
  end

  def flash_message
    flash.map do |msg_type, message|
      content_tag :div, message, class: "alert #{message_class_for(msg_type)} fade show" do
        content_tag(:button, "x".html_safe, class: "close", data: {dismiss: 'alert'}) + message
      end
    end.join.html_safe
  end
end
