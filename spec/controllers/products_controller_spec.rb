require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @products" do
      product = Product.create(name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "render show templet" do
      product = Product.create(name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :show, {id: product}
      response.should render_template('show')
    end
    it "assigns the requested product as @product" do
      product = Product.create(name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :show, {id: product.to_param}
      assigns(:product).should eq(product)
    end
  end

  describe "GET new" do
    it "should render new template" do
      get :new
      response.should render_template('new')
    end

    it "assigns a new product as @product" do
      get :new
      assigns(:product).should_not be_nil
      assigns(:product).should be_kind_of(Product)
      assigns(:product).should be_new_record
    end
  end
  describe "GET edit" do

    it "render edit template" do
      product = Product.create(name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :edit, {id: product}
      response.should render_template('edit')
    end

    it "assigns the requested product as @product" do
      product = Product.create(name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :edit, {id: product}
      assigns(:product).should_not be_nil
      assigns(:product).should eq(product)
    end
  end
  describe "POST create" do
    before do
      @product_params = {product:
                          {name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen'
                          }
      }
    end
    it "assign a @product variable" do
      post :create, @product_params
      assigns[:product].should_not be_nil
      assigns[:product].should be_kind_of(Product)
    end
    context "when Suceessfull" do
      subject {
        post :create, @product_params
      }
      it "redirects to show page" do
        subject
        response.should redirect_to(assigns[:product])
      end

      it "creates product record" do
        lambda {
          subject
        }.should change(Product, :count).by(1)

      end
    end
    context "when faillure" do
      before do
        @product_params[:product][:name]=''
      end
      it "re-renders new templet" do
        post :create, @product_params
        response.should render_template('new')
      end

      it "does not create person record" do
        lambda {
          post :create, @product_params
        }.should_not change(Product, :count).by(1)
        assigns[:product].errors.get(:name).should_not be_nil
      end
    end

  end

  describe "PUT update" do

    before do
      @product_params =
          {name: 'pen', price: 10, color: 'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen'
          }
      @new_paams={name:'New Pen'}
    end
    it "assigns value to product" do
      product = Product.create(@product_params)
      put :update, {id: product, product: @new_paams}
      assigns[:product].should_not be_nil
      assigns[:product].should be_kind_of(Product)
    end
    context "when Suceessfull" do
      it "redirects to show page" do
        product = Product.create(@product_params)
        put :update, {id: product, product: @product_params}
        response.should redirect_to(assigns[:product])
      end
      it "update product record" do
        product = Product.create(@product_params)
        put :update, {id: product, product: @product_params}
        assigns[:product].name.should == @product_params[:name]
      end
    end
    context "when faillure" do
      it "re-render to show page" do
        product = Product.create(@product_params)
        @product_params[:name] = ''
        put :update, {id: product, product: @product_params}
        response.should render_template('edit')
      end
      it " not update product record" do
        product = Product.create(@product_params)
        @product_params[:name] = nil
        new_params ={name:'',price:nil,status:nil,inward_date:nil, type:nil, description:nil}
        put :update, {id: product, product: new_params}
        assigns[:product].errors.get(:name).should_not be_nil
        assigns[:product].errors.get(:price).should_not be_nil
        assigns[:product].errors.get(:status).should_not be_nil
        assigns[:product].errors.get(:inward_date).should_not be_nil
        assigns[:product].errors.get(:type).should_not be_nil
        assigns[:product].errors.get(:description).should_not be_nil
      end

    end
  end
end
