# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class EventsController < ApplicationController
 
  def index
    @events = Event.where("date_time > ?", Time.now).order("date_time ASC").paginate(:page => params[:page])

    if !current_user
      @events = Event.limit(5)
    end

    respond_to do |format|
      format.html 
      format.json { render json: @events }
    end
  end

  def show
  	@event = Event.find(params[:id])
  	
  	@attending = EventsUser.where("event_id = ? and user_id = ?", @event.id, current_user.id).exists?
  	
  	@number_of_attending_persons = EventsUser.where("event_id = ?", @event.id).count
  	
    respond_to do |format|
      format.html 
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html 
      format.json { render json: @event }
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :ok }
    end
  end
  
  def feelinggoofy
    #@events = Event.find(:all, :order => "RAND()", :limit => 1, :conditions => ["user_id != ?", current_user.id])
    
    # ACHTUNG RAND!!!!!!!!!!!!!!!!!!!!!!!
    
    @events = Event.where("user_id != ?", current_user.id).limit(1)
    @is_empty = @events.empty?
  end
  
  def joiningevents
    #@events = Event.User.find(:all)
    #@events = Event.where("id = current_user.id", :include => [:user])
    #@events = Event.where("user_id = ?", current_user.id)
    
    #the same as: 
    #@events = Event.find(:all, :include => [:user])
    #@events = Event.joins("INNER JOIN users ON events.user_id = users.id")
    #@test = user.events.find(:all)
    #@events = User.joins("INNER JOIN users ON events_users.user_id = users.id")
  
  
    #@events = Event.where("user_id = ?", current_user.id)
    #@events = EventsUser.joins("INNER JOIN events ON events.event_id = event_id")
    
    #@events = Event.joins("INNER JOIN events_users ON events_users.event_id = event_id").where('event_users.user_id = ?', current_user.id) 
    
    #@events = find_by_sql("SELECT * FROM events INNER JOIN events_users ON events.event_id = events_users._event_id") 
    
    @is_empty = false
  end
end


