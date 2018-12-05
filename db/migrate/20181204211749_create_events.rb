class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_time
      t.string :type
      t.string :description
      t.integer :duration
      t.integer :museum_id
      t.integer :neighborhood_id
    end
  end
end
