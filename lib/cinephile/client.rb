module Cinephile
  class Client
    attr_reader :provider

    def initialize(provider)
      @provider = Provider.const_get(provider.capitalize)
    end

    def cinemas
      @provider.cinemas
    end

    def movies(cid)
      @provider.movies(cid)
    end

    def days(cid, mid)
      @provider.movies(cid, mid)
    end

    def hours(cid, mid, d)
      @provider.movies(cid, mid, d)
    end
  end
end

