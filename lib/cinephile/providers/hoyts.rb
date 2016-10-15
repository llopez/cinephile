module Cinephile
  module Provider
    module Hoyts
      extend self

      PROVIDER_URL = "http://www.hoyts.com.ar/jsonManager.aspx"

      def cinemas
        get({ type: "cines" })
      end

      def movies(cid)
        get({ type: "cinema", selected: cid })
      end

      def self.days(cid, mid)
        get({ type: "movie", cinema: cid, selected: mid })
      end

      def hours(cid, mid, d)
        get({ type: "Day", cinema: cid, movie: mid, selected: d })
      end

      private

      def get(data)
        uri = URI(PROVIDER_URL)
        uri.query = URI.encode_www_form(data)
        res = Net::HTTP.get_response(uri)
        JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
      end
    end
  end
end

