require 'cgi'

class Meme < Isis::Plugin::Base

  TRIGGER_TO_IMAGE_URL = {
    '!aliens' => 'http://v1.memecaptain.com/aliens.jpg',
    '!allthe' => 'http://v1.memecaptain.com/all_the_things.jpg',
    '!grumpycat' => 'http://i2.kym-cdn.com/photos/images/newsfeed/000/406/325/b31.jpg',
    '!dwight' => 'http://v1.memecaptain.com/dwight_schrute.jpg',
    '!fry' => 'http://i0.kym-cdn.com/photos/images/original/000/131/399/fry.PNG?1307468855',
    '!tyson' => 'http://i2.kym-cdn.com/photos/images/original/000/198/020/BRTky.jpg',
    '!bees' => 'http://img.gawkerassets.com/img/17fxr90k1uawbgif/original.gif',
    '!davidcaruso' => 'http://images.wikia.com/random-ness/images/8/8c/CSi_Miami_sunglasses.gif'
  }

  TRIGGERS = TRIGGER_TO_IMAGE_URL.keys

  def respond_to_msg?(msg, speaker)
    if TRIGGERS.include? msg.split[0]
      @meme = msg.split[0]
      remainder = msg.split[1..-1].join(' ').split(';')
      @line1 = remainder[0]
      @line2 = remainder[1]
      return true
    else
      return false
    end    
  end

  private

  # def response_html
  #   "<img src=\"#{get_meme_url}\"/>"
  # end

  def response_text
    get_meme_url
  end

  def get_meme_url
    image_url = TRIGGER_TO_IMAGE_URL[@meme]

    if @line1
      meme_url = "http://v1.memecaptain.com/i?u=#{image_url}&tt=#{CGI.escape(@line1.strip)}"
      meme_url += "&tb=#{CGI.escape(@line2.strip)}" if @line2
    else
      meme_url = image_url
    end

    meme_url
  end

end