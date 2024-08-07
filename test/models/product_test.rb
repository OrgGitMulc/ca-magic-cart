require "test_helper"

class ProductTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = :no_instances

  setup do
    @category = Category.create(name: "Accessories")
    @product = product = Product.new(
      name: "Dragon Shield Sleeves - Purple",
      description: "Matte purple card sleeves",
      price: 10.99,
      category: @category
    )
    @single_product = products(:single)
  end

  test "test .yml file" do
    # Testing if products.yml file products are available
    product = products(:single)
    assert product.save
  end

  test "should save product" do
    # Testing if any product entered by a user can be saved (CRUD functionality)
    
    assert @product.save, "Product did not save successfully: #{@product.errors.full_messages.join(", ")}"
  end

  test "find product" do
    # Testing if we can find product using its id and other filters (CRUD functionality)
    @product.save

    expected_product = Product.find(@product.id)
    assert_equal(expected_product.id, @product.id)

    expected_product = Product.find_by(name: @product.name)
    assert_equal(expected_product.name, @product.name)
    assert_equal(expected_product.price, @product.price)
  end

  test "should delete product" do
    # Testing if products can be deleted after they are added (CRUD functionality)
    @product.save
    assert_difference("Product.count", -1) do
      @product.destroy
    end
  end

  test "should update todo" do
    # Test if product can be updated (CRUD functionality)
    @single_product_update = 2.99
    @single_product.update({
      price: @single_product_update
    })
    assert_equal(2.99, @single_product.price)
  end
end
