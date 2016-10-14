module Cinephile
  class Client
    BASE_URL = "http://www.hoyts.com.ar"

    def self.get(path, params)
      uri = URI(BASE_URL + path)
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    end

    def self.theaters
      res = get("/jsonManager.aspx", { type: "cines" })

      res.map do |x|
        {
          name: x['label'],
          id: x['value']
        }
      end
    end

    def self.movies(theater_id)
      res = get("/jsonManager.aspx", { type: "cinema", selected: theater_id })

      res.map do |x|
        {
          name: x['label'],
          id: x['value']
        }
      end
    end

    def self.days(theater_id, movie_id)
      res = get("/jsonManager.aspx", { type: "movie", cinema: theater_id, selected: movie_id })

      res.map do |x|
        {
          name: x['label'],
          id: x['value']
        }
      end
    end

    def self.hours(theater_id, movie_id, day)
      res = get("/jsonManager.aspx", { type: "Day", cinema: theater_id, movie: movie_id, selected: day })

      res.map{ |x| x['label'] }
    end

  end
end
