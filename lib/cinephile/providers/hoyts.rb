module Cinephile
  module Provider
    module Hoyts
      extend self

      PROVIDER_URL = "http://www.hoyts.com.ar/jsonManager.aspx"

      def cinemas
        res = get({ type: "cines" })
        parse_response(res)
      end

      def movies(cid)
        res = get({ type: "cinema", selected: cid })
        parse_response(res)
      end

      def days(cid, mid)
        res = get({ type: "movie", cinema: cid, selected: mid })
        parse_response(res)
      end

      def hours(cid, mid, d)
        res = get({ type: "Day", cinema: cid, movie: mid, selected: d })
        parse_response(res)
      end

      private

      def get(data)
        uri = URI(PROVIDER_URL)
        uri.query = URI.encode_www_form(data)
        res = Net::HTTP.get_response(uri)
        JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
      end

      def parse_response(res)
        res.inject({}) do |m, v|
          m[v["value"]] = v["label"].gsub("Hoyts", "").strip
          m
        end
      end
    end
  end
end

