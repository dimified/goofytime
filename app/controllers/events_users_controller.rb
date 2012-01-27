# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class EventsUsersController < ApplicationController
  # GET /events_users/new
  # GET /events_users/new.json
  def new
  	@event = Event.find(params[:event_id])
  	@event_id = @event.id
    @events_user = EventsUser.new(:event_id => @event_id, :user_id => current_user.id)
    
    respond_to do |format|
      if @events_user.save
        format.html { redirect_to event_path(@event_id), notice: 'You are successfully attending.' }
        format.json { render json: @events_user, status: :created, location: @events_user }
      else
        format.html { render action: "new" }
        format.json { render json: @events_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events_users/1
  # DELETE /events_users/1.json
  def destroy
  	@events_user = EventsUser.find(:first, :conditions => ["user_id = ? and event_id = ?", current_user.id, params[:event_id]])
  	
    @events_user.destroy

    respond_to do |format|
      format.html { redirect_to event_path(params[:id]), notice: 'You are successfully unattended.' }
      format.json { head :ok }
    end
  end
end