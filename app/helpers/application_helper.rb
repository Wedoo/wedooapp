module ApplicationHelper
  
  def alert_classes(name)
    case name
    when :notice
      return 'alert-info'
    when :alert
      return 'alert-danger'
    else
      return ''
    end
  end
  
  def toggle_activation_button(object, attribute, options = {})
    options[:event_name] ||= 'form:active-inactive'
    render partial: 'partials/toggle_activation', locals: { object: object, attribute: attribute, value: object.send(attribute), event_name: options[:event_name] }
  end
  
  def modal_window(options = {}, &block)
    puts block
    options[:id] ||= nil
    options[:data] ||= nil
    content_tag(:div, class: 'modal fade', id: options[:id], data: options[:data]) do
      content_tag :div, class: 'modal-dialog' do
        content_tag :div, clasS: 'modal-content' do
          yield
        end
      end
    end
  end

end
