class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.string :movie_title
      t.datetime :start_time
      t.datetime :start_date
      t.integer :duration
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
