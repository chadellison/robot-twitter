require 'rails_helper'

RSpec.describe Follower, type: :model do
  it "has many robot_followers" do
    follower = Follower.create(name: "RT342")
    assert follower.robot_followers
  end

  it "has many robots" do
    robot1 = Robot.create(name: "MC123")
    robot2 = Robot.create(name: "MN098")
    robot3 = Robot.create(name: "YU092")
    robot = Robot.create(name: "RX456")

    follower = Follower.create(name: robot.name)
    follower.robots << robot1
    follower.robots << robot3
    expect(follower.robots).to eq [robot1, robot3]
  end

  it "has a unique name" do
    expect(Follower.create(name: "RT897")).to be_valid
    expect(Follower.create(name: "RT897")).not_to be_valid
  end
end
