class AddItemsCount < ActiveRecord::Migration
  def up

  	add_column :products, :sells, :integer, :default => 0
  end

  def down
  end
end
