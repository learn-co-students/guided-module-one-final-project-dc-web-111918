class CreateTranslationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :translations do |t|
      t.string :english
      t.string :russian
      t.string :french
      t.string :arabic
    end
  end
end
