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
      @provider.days(cid, mid)
    end

    def hours(cid, mid, d)
      @provider.hours(cid, mid, d)
    end

    def schedule
      @schedule = {}
      cinemas.map do |c_id, c_label|
        @schedule[c_label] = {}
        movies(c_id).each do |m_id, m_label|
          @schedule[c_label][m_label] = {}
          days(c_id, m_id).each do |d_id, d_label|
            @schedule[c_label][m_label][d_label] = []
            hours(c_id, m_id, d_id).each do |h_id, h_label|
              @schedule[c_label][m_label][d_label].push(h_label)
            end
          end
        end
      end
      @schedule
    end
  end
end

