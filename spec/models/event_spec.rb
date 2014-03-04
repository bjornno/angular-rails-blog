require 'spec_helper'

describe Event do
	it 'should get events for date' do
		events = Event.all
		events.each do |event|
			if event["categories"] == ["Musikk"]
				#puts event
			end
		end
	end

end