require "cinephile/version"
require "cinephile/providers/hoyts"
require "cinephile/providers/cinemark"
require "cinephile/client"
require "json"
require "uri"
require "net/http"

module Cinephile
  def self.client(provider)
    Client.new(provider)
  end

  def self.hoyts_client
    client(:hoyts)
  end
  
  def self.cinemark_client
    client(:cinemark) 
  end
end
