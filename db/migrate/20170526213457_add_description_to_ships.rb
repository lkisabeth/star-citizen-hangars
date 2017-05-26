class AddDescriptionToShips < ActiveRecord::Migration[5.1]
  def change
    add_column :ships, :description, :string
  end
end
