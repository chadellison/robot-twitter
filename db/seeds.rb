class RandomName
  attr_reader :names
  def initialize
    @names = []
  end

  def generate_name
    name = ""
    letters = ("A".."Z").to_a
    2.times { name += letters.sample }
    3.times { name += rand(0..9).to_s }
    generate_name if names.include?(name)
    names << name
    name
  end
end

all_names = RandomName.new

500.times do |n|
  robot = Robot.create(name: all_names.generate_name)
  robot.posts.create(title: "binary version #{n}", content: "#{n * robot.id}")
  follower = Follower.create(name: robot.name)
  robot.followers << Follower.limit(n).order("RANDOM()")
  robot.followers = robot.followers.uniq
  puts robot.name
end
