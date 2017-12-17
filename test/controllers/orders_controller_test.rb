require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { delivery_apartment_number: @order.delivery_apartment_number, delivery_city: @order.delivery_city, delivery_house_number: @order.delivery_house_number, delivery_price: @order.delivery_price, delivery_street: @order.delivery_street, payment_method_id: @order.payment_method_id, shipping_method_id: @order.shipping_method_id, status: @order.status, subtotal: @order.subtotal, tax: @order.tax, total: @order.total, tracking_number: @order.tracking_number } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { delivery_apartment_number: @order.delivery_apartment_number, delivery_city: @order.delivery_city, delivery_house_number: @order.delivery_house_number, delivery_price: @order.delivery_price, delivery_street: @order.delivery_street, payment_method_id: @order.payment_method_id, shipping_method_id: @order.shipping_method_id, status: @order.status, subtotal: @order.subtotal, tax: @order.tax, total: @order.total, tracking_number: @order.tracking_number } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
