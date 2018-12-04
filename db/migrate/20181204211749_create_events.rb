class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_time
      t.string :type
      t.integer :duration
      t.integer :id_museum
      t.integer :id_neighborhood
    end
  end
end
