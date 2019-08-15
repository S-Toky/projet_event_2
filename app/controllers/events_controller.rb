class EventsController < ApplicationController

  before_action :authenticate_user!, except:[:index, :show]

  def index
  	@event = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
    @event = Event.create(title: params[:title], 
      start_date: params[:start_date], 
      duration: params[:duration], 
      price: params[:price], 
      description: params[:description],
      admin_id: current_user.id.to_i,
      location: params[:location]
      )

  	if @event.save

  		redirect_to action: "index"
  	else
  		render "new"
  	end
  end

  def edit
    @event = Event.find(params[:id])
    
  end

  def update
     @event = Event.find(params[:id])
     event_params = params.permit(:title,
                                                  :description,
                                                  :start_date,
                                                  :duration,
                                                  :price,
                                                  :location,
                                                  :admin_id
                                                  )
     
      if @event.update(event_params)
          redirect_to action: "show"
        else
          render "new"
      end
  end

  def destroy
    @event = Event.find(params[:id])
    if permission_user?(@event)
    @event.destroy
    redirect_to action: "index"
  else
    render "show"
  end
    
  end

  private

  def permission_user?(event)
    if current_user.id != @event.admin.id
      false
    else
     true
    end
    
  end
end
