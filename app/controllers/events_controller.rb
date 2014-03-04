class EventsController < ApplicationController
	respond_to :json

  def index
		events = Event.all

    respond_with(events) do |format|
      format.json { render :json => events.as_json }
    end
  end
end
