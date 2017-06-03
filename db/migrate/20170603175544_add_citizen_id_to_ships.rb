class AddCitizenIdToShips < ActiveRecord::Migration[5.1]
  def change
    add_column :ships, :citizen_id, :integer
  end
end
