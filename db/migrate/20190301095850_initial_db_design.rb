class InitialDbDesign < ActiveRecord::Migration[5.2]
  def change
    create_table :game_configs do |t|
      t.string :key
      t.string :value
      t.timestamps
    end

    create_table :levels do |t|
      t.string :identifier
      t.string :level_intro_message
      t.string :game_conclusion_message
      t.string :show_score_conclusion_level
      t.string :next_level
      t.timestamps
    end

    create_table :steps do |t|
      t.string :identifier
      t.string :file1_name
      t.string :file1_content
      t.string :file1_clarification
      t.string :file2_name
      t.string :file2_content
      t.string :file2_clarification
      t.timestamps

      t.references :level
    end

    create_table :questions do |t|
      t.string :text
      t.string :correct_answer
      t.timestamps

      t.references :step
    end

    create_table :answers do |t|
      t.string :text
      t.integer :points
      t.timestamps

      t.references :question
    end
  end
end
