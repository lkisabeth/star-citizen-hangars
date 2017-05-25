class CreateShips < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
    end
  end
end
