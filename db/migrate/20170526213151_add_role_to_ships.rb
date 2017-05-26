class AddRoleToShips < ActiveRecord::Migration[5.1]
  def change
    add_column :ships, :role, :string
  end
end
