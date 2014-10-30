ActiveAdmin.register Product do

	index do
		column :id
	  	column :title
	  	column :image_url
	  	column :price
	  	column :created_at
	  	column :updated_at
	  	column :featured_at
	  	column :sells
  		default_actions
	end

	action_item only: :show do 
		
    	product = Product.find(params[:id])
		product.featured_at = Time.now
		product.save
    	link_to 'Pick this Product'
    	#redirect_to {:action => :show}, {:notice => "Locked!"}
   end
end
