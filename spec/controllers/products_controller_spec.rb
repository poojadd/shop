require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET index" do

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "assigns @products" do
      product = Product.create
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
