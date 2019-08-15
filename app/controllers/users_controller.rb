class UsersController < ApplicationController
before_action :authenticate_user!

  def show
  	@events = Event.all
  	@event = Event.find(params[:id]) 
  	@user = current_user

  end

  def edit
  	@user = current_user
  	
  end
end
