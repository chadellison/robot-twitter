class Follower < ApplicationRecord
  has_many :robot_followers
  has_many :robots, through: :robot_followers
  validates_uniqueness_of :name
end
