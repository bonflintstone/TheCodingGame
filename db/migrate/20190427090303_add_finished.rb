class AddFinished < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :finished, :boolean
  end
end
