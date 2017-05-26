class AddProductionStateToShips < ActiveRecord::Migration[5.1]
  def change
    add_column :ships, :production_state, :string
  end
end
