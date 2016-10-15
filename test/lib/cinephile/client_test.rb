require 'test_helper'

class Cinephile::ClientTest < Minitest::Test
  def test_provider_setup
    client = Cinephile::Client.new(:hoyts)
    assert_kind_of Cinephile::Provider::Hoyts, client.provider
  end
end

