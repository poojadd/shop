require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @valid_attributes = {
        name: 'pen', price: 10, color:'red', status:1, inward_date:'12/12/2016',type:'Pen',description:'best pen'
    }
  end
  describe "validations" do
    describe "Presence validations" do
      before do
        @product=Product.create
        @product.should_not be_valid
      end

      [:name, :price, :status,:inward_date,:type,:description].each do |attributes|
        it "Must have #{attributes}" do
          @product.errors.get(attributes).should_not be_nil
        end
      end
    end
    describe "Numericality" do
      [:price].each do |attributes|
        it "Must have price as #{attributes}" do
          @valid_attributes[attributes]="asdfs"
          @product=Product.create(@valid_attributes)
          @product.should_not be_valid
          @product.errors.get(attributes).should_not be_nil
        end
        it "Must aceept decimal Number" do
          @valid_attributes[attributes]=12.45
          @product=Product.create(@valid_attributes)
          @product.should be_valid
          @product.errors.get(attributes).should be_nil
        end
      end
    end
  end
end
