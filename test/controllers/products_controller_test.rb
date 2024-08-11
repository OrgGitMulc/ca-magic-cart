require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:single)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { category_id: @product.category_id, description: @product.description, name: @product.name, price: @product.price } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { category_id: @product.category_id, description: @product.description, name: @product.name, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "should not create product with wrong inputs" do
    # Custom functionality tests to test if any fields left null/empty
    assert_no_difference("Product.count") do
      post products_url, params: { product: { name: "", price: nil } }  # invalid attributes
    end
  
    assert_response :unprocessable_entity
  
    assert_select 'div', text: /prohibited this product from being saved/
    assert_select 'ul li', text: /Name can't be blank/
    assert_select 'ul li', text: /Price can't be blank/
    assert_select 'ul li', text: /Price is not a number/
  end

end
