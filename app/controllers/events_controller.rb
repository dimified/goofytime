class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.find(:all, :order => 'date_time')
    @events = Event.where(["date_time > ?", Time.now])
    @events = Event.paginate(:page => params[:page])
    
    if !current_user
      @events = Event.limit(5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  	@event = Event.find(params[:id])
  	
  	@user_id = Event.find(@event.id).user_id
  	@user_firstname = User.find(@user_id).first_name
  	
  	if @user_id == current_user.id
      @owner = 1
    else  
  	  @owner = 0
  	  
  	  if(EventsUser.where("event_id = ? and user_id = ?", @event.id, current_user.id).count > 0)
  	    @attending = 1
  	  else
  	    @attending = 0  
  	  end
  	end  
		
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
  	@event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, warning: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  def trythis
    @events = Event.find(:all, :order => "random()", :limit => 1)
  end
  
  def myevents
  
    @events = Event.find(:all, :order => 'date_time')
    @events = Event.where("user_id = ?", params[:user_id])
    #@events = Event.paginate(:page => params[:page])
  end
  
  def joiningevents
    @joining_events = EventsUser.where("user_id = ?", current_user.id)
  end
end
