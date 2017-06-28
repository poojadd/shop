json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :color, :status, :inward_date, :type, :description
  json.url product_url(product, format: :json)
end
