$:.unshift(File.join(File.dirname(__FILE__),'..','..','lib'))

require 'minitest/autorun'
require 'rb-lomo'

class Client < MiniTest::Unit::TestCase
  def setup
    @client = Rb::Lomo::Client.new('API-KEY')
  end

  def test_popular_photos
    @photos = @client.popular_photos
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end

  def test_selected_photos
    @photos = @client.selected_photos
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end

  def test_cameras
    @cameras = @client.cameras
    refute_empty @cameras
    assert_instance_of Array, @cameras
    assert_instance_of Rb::Lomo::Camera, @cameras.sample
  end

  def test_popular_camera_photos
    @photos = @client.popular_camera_photos '3314883'
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end

  def test_recent_camera_photos
    @photos = @client.recent_camera_photos '3314883'
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end

  def test_films
    @films = @client.films
    refute_empty @films
    assert_instance_of Array, @films
    assert_instance_of Rb::Lomo::Film, @films.sample
  end

  def test_popular_film_photos
    @photos = @client.popular_film_photos '871911028'
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end

  def test_recent_film_photos
    @photos = @client.recent_film_photos '871911028'
    refute_empty @photos
    assert_instance_of Array, @photos
    assert_instance_of Rb::Lomo::Photo, @photos.sample
  end
end
