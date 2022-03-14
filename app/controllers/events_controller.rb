class EventsController < ApplicationController
  # GET /
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    params.permit(:title, :x_day, :description, :locale, :body, :password, :owner, :place, :set_time, :break_time, :deadline, :contact_to, :limit)
    logger.debug params[:event]

    event = Event.new(
      title: params[:title],
      owner: params[:owner],
      x_day: params[:x_day],
      place: params[:place],
      setup_time: params[:setup_time],
      break_time: params[:break_time],
      deadline: params[:deadline],
      contact_to: params[:contact_to],
      limit: params[:limit],
      locale: params[:locale].to_i,
      description: params[:description],
      body: params[:body],
    )
    event.pwd = params[:password]

    event.save!
  end

  def entry
    @entry = Event.new
    @event = Event.find(params[:event_id])
  end

  def kanji
    params.permit(:event_id)
    @event = Event.eager_load(:entries).find(params[:event_id])
  end
end
