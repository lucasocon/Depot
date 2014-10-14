class StoreController < ApplicationController
	skip_before_filter :authorize
	include CurrentCart
	before_filter :set_cart
  def index
  	if params[:set_locale]
  		redirect_to store_url(locale: params[:set_locale])
  	else
  	  @products = Product.order(:title)
  	end
  end
end
