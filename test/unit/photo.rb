$:.unshift(File.join(File.dirname(__FILE__),'..','..','lib'))

require 'minitest/autorun'
require 'rb-lomo'

class Photo < MiniTest::Unit::TestCase
  def setup
    @client = Rb::Lomo::Client.new('API-KEY')
    @photo  = @client.popular_photos.sample
  end

  def test_that_photo_has_an_id
    refute_nil @photo.id
  end

  def test_that_photo_has_a_url
    refute_nil @photo.url
  end

  def test_that_photo_returns_a_camera_object_if_data_available
    if @photo.camera
      assert_instance_of Rb::Lomo::Camera, @photo.camera
    end
  end

  def test_that_photo_returns_a_film_object_if_data_available
    if @photo.film
      assert_instance_of Rb::Lomo::Film, @photo.film
    end
  end

  def test_that_photo_returns_a_user_object_if_data_available
    if @photo.user
      assert_instance_of Rb::Lomo::User, @photo.user
    end
  end
end
