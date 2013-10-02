require 'cgi'

class Meme < Isis::Plugin::Base

  def respond_to_msg?(msg, speaker)
    args = msg.split
    if args[0] == '!meme'
      @meme = args[1]
      @line1 = args[2].split(';')[0]
      @line2 = args[2].split(';')[1]
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
    if @meme.starts_with?('http')
      image_url = @meme
    else
      image_url = "http://memecaptain.com/#{@meme}.jpg"
    end

    meme_url = "http://v1.memecaptain.com/i?u=#{image_url}&tt=#{CGI.escape(@line1.strip)}"
    meme_url += "&tb=#{CGI.escape(@line2.strip)}" if @line2

    meme_url
  end

end