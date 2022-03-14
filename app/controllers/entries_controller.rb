class EntriesController < ApplicationController
  def index
    params.permit(:event_id)

    @event = Event.find(params[:event_id])
    @entries = Entry.where(event: @event).order(index: :asc)
  end

  def create
    params.permit(:name, :kana, :bike, :maker, :status, :comment, :password, :commit, :event_id)

    entry = Entry.new(
      event: Event.find(params[:event_id]),
      name: params[:name],
      bike: params[:bike],
      comment: params[:comment],
      maker: params[:maker].to_i,
      status: params[:status].to_i
    )

    entry.pwd = params[:password]
    entry.set_index

    entry.save!
    redirect_to action: :index
  end

  def edit
    @event = Event.find(params[:event_id])
    @entry = Entry.find(params[:entry_id])
  end

  def update
    entry = Entry.find(params[:id])
    params.permit(:name, :kana, :bike, :maker, :status, :comment, :password, :event_id)

    unless entry.valid_password? params[:password]
      render 403, json: {
        error: "invalid password"
      }
      return
    end

    entry.bike = params[:bike]
    entry.name = params[:name]
    entry.kana = params[:kana]
    entry.maker = params[:maker].to_i
    entry.status = params[:status].to_i
    entry.comment = params[:comment]
    entry.set_index

    entry.save!

    redirect_to action: :index
  end
end
