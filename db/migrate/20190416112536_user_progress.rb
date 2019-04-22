class UserProgress < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :levels
    add_reference :users, :step
  end
end
