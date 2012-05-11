$:.unshift(File.join(File.dirname(__FILE__),'..','..','lib'))

require 'minitest/autorun'
require 'rb-lomo'

class Photo < MiniTest::Unit::TestCase
  def setup
    @client = Rb::Lomo::Client.new('API-KEY')
    @photo  = @client.popular_photos.sample
  end
  #TODO:
end
