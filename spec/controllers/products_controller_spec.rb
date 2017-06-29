require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @products" do
      product = Product.create(:name=>'pen', :price=>10, :color=>'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen')
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
