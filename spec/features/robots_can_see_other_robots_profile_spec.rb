require "rails_helper"

RSpec.feature "Robot can see other robots profile" do
  scenario "Robot sees who the number of robots a robot is following and the number of robots following the robot" do
    robot1 = Robot.create(name: "ZI123")
    robot1.posts.create(title: "Binary",
                        content: "Talented Robots: recite 1 billion plus binary digits")

    Robot.create(name: "BV452")
    Robot.create(name: "VC509")
    robot2 = Robot.create(name: "BN008")
    robot3 = Robot.create(name: "N5089")

    robot1.followers.create(name: "BV452")
    robot1.followers.create(name: "VC509")
    robot1.followers.create(name: "BN008")


    robot2.followers << Follower.create(name: robot1.name)
    robot3.followers << Follower.find_by(name: robot1.name)

    visit root_path

    click_on "-ZI123"

    expect(current_path).to eq robot_path(robot1.id)
    expect(page).to have_content "Followers: 3"
    expect(page).to have_content "Following: 2"
  end
end
