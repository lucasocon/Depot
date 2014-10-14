require 'spec_helper'

	describe ProductsController do
		it "populates an array of products" do
			product = FactoryGirl.create(:product)
			get :index
			assigns(:products).should eq([product])
		end
		it "renders the :index view" do
			get :index
			response.should render_template :index
		end
	end

	describe "GET #show" do
		it "assigns the requerested product to @product" do
			product = FactoryGirl.create(:product)
			get :show, id: product
			assigns(:product).should eq(product)
		end
		it "renders the :show template" do
			product = FactoryGirl.create(:product)
      		get :show, id: product
      		response.should render_template :show
		end
	end

	describe "GET #new" do
		it "assigns a new Product to @product" do
			get :new
			@product = Product.new
		end
		it "renders the :new template" do
			product = FactoryGirl.create(:product)
      		get :new, id: product
      		response.should render_template :new
		end
	end


	describe "POST #create" do
		context "with valid attributes" do
			it "saves the new product" do
				expect{
					post :create, product: FactoryGirl.attributes_for(:product)
				}.to change (Product, :count).by(1)
			end
			it "redirects to the created product" do
				post :create, product: FactoryGirl.attributes_for(:product)
				responde.should redirect_to(Product.last)
			end
		end

		context "with a invalid attributes" do
			it "does not save the new product" do
				Product.any_instance.stub(:save).and_return(false)
        		post :create, {:product => { "title" => "invalid value" }}
        		assigns(:product).should be_a_new(Product)
			end
			it "re-renders to the :new template" do
				Product.any_instance.stub(:save).and_return(false)
        		post :create, {:product => { "title" => "invalid value" }}
        		response.should render_template("new")
			end
		end
	end

	describe "PUT update" do
		before :each do
			@product = FactoryGirl.create(:product, title: "Lord of the Rings")
		end


		context "atributos validos" do
			it "encontrar el producto a editar" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:product)
				assigns(:product),should eq(@product)
			end
			it "cambia atributos de @product" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:product, title: "Lord of the Rings")
				@product.reload
				@product.title.should eq("Lord of the Rings")
			end
			it "redirecciona al producto editado" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:product)
				response.should redirect_to @product
			end
		end

		context "atributos invalidos" do
			it "encuentra el producto a editar" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product)
				assigns(:product).should eq(@product)
			end
			it "no cambia los atributos del producto" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product, title: "Narnia", price: 0)
				@product.reload
				@product.title.should_not eq("Narnia")
				@product.price.should_not eq(0)
			end
			it "re-render to the edit template" do
				put :update, id: @product, product: FactoryGirl.attributes_for(:invalid_product)
				response.should render_template :edit
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			@contact = FactoryGirl.create(:product)
		end

		it "eliminar el producto" do
			expect {
				delete :destroy, id: @product
			}.to change(Product,:count).by(-1)
		end
		it "redirect to products" do
			delete :destroy, id: @product
			response.should redirect_to products_url
		end
	end
end