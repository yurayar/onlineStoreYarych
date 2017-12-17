json.extract! order, :id, :subtotal, :delivery_price, :tax, :total, :delivery_city, :delivery_street, :delivery_house_number, :delivery_apartment_number, :payment_method_id, :shipping_method_id, :tracking_number, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
