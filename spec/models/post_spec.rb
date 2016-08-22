require 'rails_helper'

RSpec.describe Post, type: :model do
  it "belongs to a robot" do
    robot = Robot.create(name: "jones")
    post = Post.create(title: "a", content: "1", robot_id: robot.id)
    expect(post.robot).to eq robot
  end
end
