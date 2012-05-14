$:.unshift(File.join(File.dirname(__FILE__),'..','..','lib'))

require 'minitest/autorun'
require 'rb-lomo'

class CameraTest < MiniTest::Unit::TestCase
  def setup
    @client = Rb::Lomo::Client.new('API-KEY');
    @camera = @client.cameras.sample
  end

  def test_that_camera_has_an_id
    refute_nil @camera.id
  end

  def test_that_camera_has_a_name
    refute_nil @camera.name
  end
end
