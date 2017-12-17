json.extract! product, :id, :inventory_id, :title, :description, :price, :available_quantity, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
