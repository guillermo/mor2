class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new params[:event]
    if @event.save
      render
    else
      render :action=>:new
    end
  end

end
