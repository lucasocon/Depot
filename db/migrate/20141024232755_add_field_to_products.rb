class AddFieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :featured_at, :datetime, :null => true

  end
end
