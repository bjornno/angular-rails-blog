class Event
	def self.all
		date = "2014-03-07"
		resp = HTTParty.get("http://event.aftenposten.no/evt/json/findEvent?text=&dateFrom=#{date}&dateTo=#{date}")
		resp.parsed_response.map do |event|
			{	
				"name" => event["name"],
				"time_from" => event["timeFrom"],
				"time_to" => event["timeTo"],
				"place" => event["place"],
				"categories" => event["categories"]
			}
		end
	end
end