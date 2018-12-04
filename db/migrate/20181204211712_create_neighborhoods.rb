class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhood do |t|
      t.string :name
  end
end
