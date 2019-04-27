class UserProgress < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :level
    add_reference :users, :step
  end
end
