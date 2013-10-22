module InitiativesHelper
  
  def tweet_url(initiative)
    "https://twitter.com/intent/tweet?text=#{initiative.title}&hashtags=#{initiative.hashtag}&url=#{ong_initiative_url(ong, initiative)}&via=wedoo"
  end
  
  def facebook_url(initiative)
    "https://www.facebook.com/sharer/sharer.php?u=#{ong_initiative_url(ong, initiative)}"
  end
  
  def donation_button
    button_response = Donation.create_donate_button(10, 'http://localhost', 'http://localshot')
    button = button_response.success? ? button_response.Website : button_response.Errors
    button.html_safe
  end
  
  def form_options(initiative)
    base = { html: { multipart: true } }
    if initiative.new_record?
      base.merge({ url: ong_initiatives_path(ong) })
    else
      base.merge({ url: ong_initiative_path(ong, initiative), method: :patch })
    end
  end
  
  def active_inactive(form, name)
    value = form.object.send(name.to_sym)
    out = capture do 
      content_tag :label, class: ('btn btn-sm' + (value ? '' : ' active')) do
        form.radio_button(name, false) + "inactivo"
      end
    end
    out << capture do 
      content_tag :label, class: ('btn btn-sm' + (value ? ' active' : '')) do
        form.radio_button(name, true) + "activo"
      end
    end
    content_tag :div, class: 'btn-group', data: { toggle: 'buttons' } do
      out
    end
  end
  
end
