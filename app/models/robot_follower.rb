class RobotFollower < ApplicationRecord
  belongs_to :robot
  belongs_to :follower
end
