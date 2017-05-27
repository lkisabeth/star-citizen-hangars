class RemoveNameFromShips < ActiveRecord::Migration[5.1]
  def change
    remove_column :ships, :name
  end
end
