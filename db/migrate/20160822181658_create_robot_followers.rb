class CreateRobotFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :robot_followers do |t|
      t.references :robot, foreign_key: true
      t.references :follower, foreign_key: true

      t.timestamps
    end
  end
end
