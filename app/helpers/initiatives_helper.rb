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
  
end
