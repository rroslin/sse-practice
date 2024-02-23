class CreateOutcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :outcomes do |t|
      t.string :lis_result_sourcedid
      t.float :score
      t.float :passing_threshold

      t.timestamps
    end
  end
end
