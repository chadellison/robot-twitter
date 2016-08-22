require 'rails_helper'

RSpec.describe Robot, type: :model do
  it "has many posts" do
    robot = Robot.create(name: "jones")
    post = robot.posts.create(title: "a", content: "1")
    expect(robot.posts).to eq [post]
  end
end
