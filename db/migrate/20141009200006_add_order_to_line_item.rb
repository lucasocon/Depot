class AddOrderToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :order, :references

  end
end
