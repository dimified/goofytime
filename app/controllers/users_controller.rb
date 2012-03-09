# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class UsersController < ApplicationController

  def index
    @users = User.order('first_name ASC')
    # decrement user count to exclude current user account
    @user_count = @users.count - 1
    
    respond_to do |format|
    	format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @events = Event.where("user_id = ?", params[:id]).order('date_time ASC')
    
  	@user = User.find(params[:id])
		
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
  	@user = User.find(session[:user_id])
  end

  def create
    @user = User.new(params[:user])
    @user = User.create(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(current_user.id), notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :ok }
    end
  end
  
  # detach photo
  def deletephoto
  	@user = User.find(params[:id])
  	@user.photo = nil
  	@user.save
  	
  	respond_to do |format|
      format.html { redirect_to user_path(current_user.id) }
      format.json { head :ok }
    end
    end
end
