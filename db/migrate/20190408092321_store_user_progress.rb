class StoreUserProgress < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :score

      t.references :question
      t.references :answer
      t.references :user
      t.timestamps
    end

    add_column :levels, :order, :integer
    add_column :steps, :order, :integer
    add_column :questions, :order, :integer
  end
end
