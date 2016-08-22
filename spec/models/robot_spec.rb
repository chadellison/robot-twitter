require 'rails_helper'

RSpec.describe Robot, type: :model do
  it "has many posts" do
    robot = Robot.create(name: "jones")
    post = robot.posts.create(title: "a", content: "1")
    expect(robot.posts).to eq [post]
  end

  it "has a unique name" do
    expect(Robot.create(name: "RX765")).to be_valid
    expect(Robot.create(name: "RX765")).not_to be_valid
    expect(Robot.count).to eq 1
  end

  it "has many robot_followers" do
    robot = Robot.create(name: "II323")
    assert robot.robot_followers
  end

  it "has many followers" do
    robot = Robot.create(name: "EE345")

    robot2 = Robot.create(name: "OP345")
    robot3 = Robot.create(name: "MO345")

    follower1 = Follower.create(name: robot2.name)
    follower2 = Follower.create(name: robot3.name)

    robot.followers << follower1
    robot.followers << follower2
    expect(robot.followers).to eq [follower1, follower2]
  end

  it "has many robots that it is following" do
    robot = Robot.create(name: "EE345")

    robot2 = Robot.create(name: "OP345")

    follower1 = Follower.create(name: robot2.name)

    robot.followers << follower1
    expect(robot2.following).to eq [robot.name]
  end
end
