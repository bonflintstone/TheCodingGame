class StoreUserProgress < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :score

      t.references :step
      t.references :user
      t.timestamps
    end

    create_table :answers_results, id: false do |t|
      t.references :result, null: false
      t.references :answer, null: false
    end

    add_column :levels, :order, :integer
    add_column :steps, :order, :integer
    add_column :questions, :order, :integer
  end
end
