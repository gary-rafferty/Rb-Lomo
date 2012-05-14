$:.unshift(File.join(File.dirname(__FILE__),'..','..','lib'))

require 'minitest/autorun'
require 'rb-lomo'

class FilmTest < MiniTest::Unit::TestCase
  def setup
    @client = Rb::Lomo::Client.new('API-KEY');
    @film = @client.films.sample
  end

  def test_that_film_has_an_id
    refute_nil @film.id
  end

  def test_that_film_has_a_name
    refute_nil @film.name
  end
end
