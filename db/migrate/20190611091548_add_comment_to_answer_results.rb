class AddCommentToAnswerResults < ActiveRecord::Migration[5.2]
  def change
    drop_table :answers_results

    create_table :answer_results do |t|
      t.references :answer
      t.references :result

      t.column :comment, :string
    end
  end
end
