class Product < ActiveRecord::Base
  self.inheritance_column = :type

  scope :pens, -> { where(type: 'Pen') }
  scope :notebooks, -> { where(type: 'Notebook') }
  def self.types
    %w(Pen Notebook)
  end

end
