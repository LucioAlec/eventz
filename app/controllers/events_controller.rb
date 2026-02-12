class EventsController < ApplicationController
  before_action :require_signin, except: [ :index, :show ]
  before_action :require_admin, except: [ :index, :show ]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show
  @likers = @event.likers
  end

  def edit ; end


  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event successufully uptade!"
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
      if @event.save
        redirect_to @event, notice: "Event successufully created!"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event)
      .permit(:name, :description, :location, :price, :starts_at, :capacity, :image_file_name)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
