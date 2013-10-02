require 'nokogiri'
require 'open-uri'

class Blame < Isis::Plugin::Base

  BLAME_LIST = %w(Tony
    C2
    C3
    Kevin
    Alex
    Ji
    Scott
    Dunx
    iOS app
    Alfresco
    Shirlena
    Chewbacca
    MySQL
    Facebook
    PostgreSQL
    Twitter
    Puppet
    Git merge commits
    2012 Leap Second Calamity (never forget)
    Ruby
    Rails3
    Digital Fortress
    <img src="http://i.imgur.com/l4sIy.png"/>
    rake assets:precompile
    Stalin
    Synchronous Ads
    rubygems.org
    IE8
    github
    STEVENS
    Michael
    April
    Accidentally shooting April in the face
    OS X running in 32 bit mode
    news-HUNGER-THUMB-250.jpg
    susy 1.0.[6|7]
    Poltergeist
    Timed out waiting for response to {"name":"visit","args":["http://127.0.0.1:52292/glee/articles/glee-2013-scheduled-article"]}
    PostingError: OAuthException :: An unexpected error has occurred. Please retry your request later.
    Tony being in charge of the blame list
    GumGum
    JWPlayer
    Becca's iPhone
    The Disembodied Unicorn Piñata Head
    HipChat
    Townsquare Media
    Sites to Topics migration
    Genesis Media <img src="http://www.genesismedia.com/images/about-richard.jpg"/>)

  def respond_to_msg?(msg, speaker)
    msg.downcase == '!blame'
  end

  private

  def response_html
    "<b>#{BLAME_LIST.sample}</b>"
  end

  def response_text
    BLAME_LIST.sample
  end
end
