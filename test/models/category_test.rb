require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = :no_instances

  setup do
    @category = Category.create(name: "boosterbox")
    @category_fixture = categories(:one)
    @two_category = categories(:two)
  end

  test "should have fixtures" do
    # Testing if the catergories.yml file catergories are available
    assert @category_fixture.save
  end

  test "should save category" do
    # Testing if any category entered by a user can be saved (CRUD functinality)
    assert @category.save, "Category did not save successfully: #{@category.errors.full_messages.join(", ")}}"
  end

  test "should find category" do
    # Testing if we can find category using its id and/or name (CRUD functionality)
    @category.save

    expected_category = Category.find(@category.id)
    assert_equal(expected_category.id, @category.id)

    expected_category = Category.find_by(name: @category.name)
    assert_equal(expected_category.name, @category.name)
  end

  test "should delete category" do
    # Testing if category can be deleted after creation (CRUD functionality)
    @category.save
    assert_difference("Category.count", -1) do
      @category.destroy
    end
  end

  test "should update category" do
    # Test if category can be updated (CRUD functionality)
    two_category_update = "playmats"
    @two_category.update({
      name: two_category_update
    })
    assert_equal("playmats", @two_category.name)
  end

end
