class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
  end
end
