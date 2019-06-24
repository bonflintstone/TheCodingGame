class AddTimestampsToAnswerResults < ActiveRecord::Migration[5.2]
  def change
    change_table :answer_results, &:timestamps
  end
end
