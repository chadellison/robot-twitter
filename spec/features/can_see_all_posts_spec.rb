require "rails_helper"

RSpec.feature "Can see all posts" do
  scenario "post titles and content are displayed" do
    robot1 = Robot.create(name: "MX592")
    robot2 = Robot.create(name: "ZL672")

    robot1.posts.create(title: "My post", content: "Check out these video games for robots")
    robot2.posts.create(title: "Another post", content: "Skateboards for robots here")

    visit root_path

    expect(page).to have_content "My post"
    expect(page).to have_content "Check out these video games for robots"

    expect(page).to have_content "Another post"
    expect(page).to have_content "Skateboards for robots here"
  end
end
