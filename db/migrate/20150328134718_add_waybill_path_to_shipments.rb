class AddWaybillPathToShipments < ActiveRecord::Migration
  def change
  	add_column :spree_shipments, :file_path, :string
  end
end


