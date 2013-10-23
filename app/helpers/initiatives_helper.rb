module InitiativesHelper
  
  def tweet_url(initiative)
    "https://twitter.com/intent/tweet?text=#{initiative.title}&hashtags=#{initiative.hashtag}&url=#{ong_initiative_url(ong, initiative)}&via=wedoo"
  end
  
  def facebook_url(initiative)
    "https://www.facebook.com/sharer/sharer.php?u=#{ong_initiative_url(ong, initiative)}"
  end
  
  def donation_button
    unless (ong_paypal = @initiative.ong.get_paypal).nil?
      button_response = ong_paypal.create_donate_button(
        :amount=>10, 
        :return_url=> thanks_ong_initiative_donations_url(ong, @initiative), 
        :notify_url => ong_initiative_donations_url(ong, @initiative),
        :cancel_return =>no_thanks_ong_initiative_donations_url(ong, @initiative)
      )
      button = button_response.success? ? button_response.Website : button_response.Errors
      button.html_safe
    end
  end
  
  def form_options(initiative)
    base = { html: { multipart: true } }
    if initiative.new_record?
      base.merge({ url: ong_initiatives_path(ong) })
    else
      base.merge({ url: ong_initiative_path(ong, initiative), method: :patch })
    end
  end
    
end
