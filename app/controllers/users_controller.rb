# Fachhochschule Salzburg
# MultimediaTechnology B 2010
# Basisqualifikationsprojekt 2a
# Daniel Krenmayr, Dimitri Reifschneider

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.find(:all, :order => 'first_name')
    
    respond_to do |format|
    	format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @events = Event.find(:all, :order => 'date_time')
    @events = Event.where("user_id = ?", params[:user_id])
    
  	@user = User.find(params[:user_id])
		
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  	@user = User.find(session[:user_id])
  end

  # POST /users
  # POST /users.json
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

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_path(current_user.id, :user_id => current_user.id), notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user.id, :user_id => current_user.id) }
      format.json { head :ok }
    end
  end
  
  # DETACH photo
  def deletephoto
  	@user = User.find(params[:id])
  	@user.photo = nil
  	@user.save
  	
  	respond_to do |format|
      format.html { redirect_to user_path(current_user.id, :user_id => current_user.id) }
      format.json { head :ok }
    end
    end
end
