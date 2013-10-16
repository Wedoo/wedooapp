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
  
end
