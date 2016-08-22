require "rails_helper"

RSpec.feature "Robot can see other robots followers and following" do
  scenario "Robot sees who the robot is following and who is following the robot" do
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

    click_on "Followers: 3"

    expect(page).to have_content "BV452"
    expect(page).to have_content "VC509"
    expect(page).to have_content "BN008"

    click_on "VC509"
    expect(current_path).to eq robot_path(Robot.find_by(name: "VC509").id)

    visit robot_path(Robot.find_by(name: "ZI123").id)

    click_on "Following: 2"
    expect(page).to have_content "BN008"
    expect(page).to have_content "N5089"

    click_on "BN008"
    expect(current_path).to eq robot_path(Robot.find_by(name: "BN008").id)
  end
end
