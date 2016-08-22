class FollowersController < ApplicationController
  def index
    @followers = Robot.find(params[:id]).followers
  end
end
