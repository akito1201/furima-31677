class AddBuildingToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :building, :string
  end
end
