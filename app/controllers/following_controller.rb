class FollowingController < ApplicationController
  def index
    @following = Robot.find(params[:id]).following
  end
end
