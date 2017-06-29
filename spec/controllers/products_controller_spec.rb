require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @products" do
      product = Product.create#(:name=>'pen', :price=>10, :color=>'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    product = Product.create(:name=>'pen', :price=>10, :color=>'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
    it "render show templet" do
      get :show, {:id => product}
      response.should render_template('show')
    end
    it "assigns the requested product as @product" do
      get :show, {:id => product.to_param}
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
    product = Product.create(:name=>'pen', :price=>10, :color=>'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
    it "render edit template" do
      get :edit, {:id => product}
      response.should render_template('edit')
    end

    it "assigns the requested tree as @tree" do
      get :edit, {:id => product}
      assigns(:product).should_not be_nil
      assigns(:product).should eq(product)
    end


  end
end
