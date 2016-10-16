require 'test_helper'

class Cinephile::ClientTest < Minitest::Test
  def setup
    @cinemas_res = YAML.load_file(File.expand_path("cinemas.yml", "test/data"))
    @movies_res = YAML.load_file(File.expand_path("movies.yml", "test/data"))
    @days_res = YAML.load_file(File.expand_path("days.yml", "test/data"))
    @hours_res = YAML.load_file(File.expand_path("hours.yml", "test/data"))
  end

  def test_hoyts_provider_set
    client = Cinephile::Client.new(:hoyts)
    assert_kind_of Cinephile::Provider::Hoyts, client.provider
  end

  def test_cinemark_provider_set
    client = Cinephile::Client.new(:cinemark)
    assert_kind_of Cinephile::Provider::Cinemark, client.provider
  end

  def test_cinemas_response
    Cinephile::Provider::Hoyts.stub(:get, @cinemas_res) do
      client = Cinephile::Client.new(:hoyts)
      assert_equal({ "1" => "Cinema 1", "2" => "Cinema 2" }, client.cinemas)
    end 
  end

  def test_movies_response
    Cinephile::Provider::Hoyts.stub(:get, @movies_res) do
      client = Cinephile::Client.new(:hoyts)
      assert_equal({ "5" => "Movie 1", "6" => "Movie 2" }, client.movies(1))
    end 
  end

  def test_days_response
    Cinephile::Provider::Hoyts.stub(:get, @days_res) do
      client = Cinephile::Client.new(:hoyts)
      assert_equal({ "3" => "Day 1", "4" => "Day 2" }, client.days(1, 5))
    end 
  end

  def test_hours_response
    Cinephile::Provider::Hoyts.stub(:get, @hours_res) do
      client = Cinephile::Client.new(:hoyts)
      assert_equal({ "7" => "22 hs", "8" => "24 hs" }, client.hours(1, 5, 3))
    end 
  end
end

