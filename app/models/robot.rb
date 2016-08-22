class Robot < ApplicationRecord
  has_many :posts
  has_many :robot_followers
  has_many :followers, through: :robot_followers
  validates_uniqueness_of :name

  def following
    Robot.joins(:followers).where(followers: {name: name}).pluck(:name)
  end
end
