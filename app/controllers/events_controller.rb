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

    redirect_to action: :show, id: event.id
  end

  def update
    params.permit(:id, :title, :owner, :x_day, :locale, :place, :setup_time, :break_time, :setup_place, :contact_to, :status, :description, :body)
    @event = Event.find(params[:id])

    @event.title = params[:title]
    @event.owner = params[:owner]
    @event.x_day = params[:x_day]
    @event.locale = params[:locale]
    @event.place = params[:place]
    @event.setup_time = params[:setup_time]
    @event.break_time = params[:break_time]
    @event.setup_place = params[:setup_place]
    @event.contact_to = params[:contact_to]
    @event.status = params[:status]
    @event.description = params[:description]
    @event.body = params[:body]

    @event.save!

    redirect_to action: :show, id: @event.id
  end

  def entry
    @entry = Event.new
    @event = Event.find(params[:event_id])
  end

  def kanji
    params.permit(:event_id)
    @event = Event.eager_load(:entries).find(params[:event_id])

    if session[params[:event_id]].nil?
      render template: "events/login"
      return
    end
  end

  def login
    params.permit(:event_id, :password)
    @event = Event.find(params[:event_id])

    if @event.valid_password? params[:password]
      session[params[:event_id]] = true

      redirect_to action: :kanji, id: params[:event_id]
      return
    end

    @msg = "認証に失敗しました"
  end
end
