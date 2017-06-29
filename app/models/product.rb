class Product < ActiveRecord::Base
  self.inheritance_column = :type

  validates_presence_of :name, :price, :status, :inward_date, :type, :description
  validates_numericality_of :price, :greater_than => 0
  scope :pens, -> { where(type: 'Pen') }
  scope :notebooks, -> { where(type: 'Notebook') }
  def self.types
    %w(Pen Notebook)
  end
  def self.price_sum(product_type)
    Product.where(:type => product_type).sum(:price)
  end
end
