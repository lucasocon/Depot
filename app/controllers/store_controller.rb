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

  def brand_new

    @products  = Product.brand_new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def editors_pick

    @products = Product.editors_pick

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def most_popular

    @products = Product.most_popular
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end
