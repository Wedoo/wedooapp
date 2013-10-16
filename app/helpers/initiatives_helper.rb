module InitiativesHelper
  
  def tweet_url(initiative)
    "https://twitter.com/intent/tweet?text=#{initiative.title}&hashtags=#{initiative.hashtag}&url=#{ong_initiative_url(ong, initiative)}&via=wedoo"
  end
  
  def facebook_url(initiative)
    "https://www.facebook.com/sharer/sharer.php?u=#{ong_initiative_url(ong, initiative)}"
  end
  
end
