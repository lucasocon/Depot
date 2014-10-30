ActiveAdmin.register LineItem do

  index do
  	column  :order
  	column  :cart_id
	column  :product_id
    column  :quantity
    column  :order_id
    column  :created_at
    column  :updated_at
    
    default_actions
  end
end
