require 'nokogiri'
require 'open-uri'

class Blame < Isis::Plugin::Base

  TRIGGERS = %w{!blame !disapprove}

  LIST = {
    blame: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'blame.yml')),
    disapprove: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'disapprove.yml')),
    jerkins: YAML.load(File.read(File.join ROOT_FOLDER, 'plugins', 'blame', 'jerkins.yml'))
    }

  def respond_to_msg?(msg, speaker)
    if TRIGGERS.include? msg.downcase
      @list = msg.downcase[1..-1].to_sym
      return true
    else
      return false
    end
  end

  private

  def response_html
    "<b>#{LIST[@list].sample}</b>"
  end

  def response_text
    LIST[@list].sample
  end
end
