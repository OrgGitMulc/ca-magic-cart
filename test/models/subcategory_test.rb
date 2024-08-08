require "test_helper"

class SubcategoryTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = :no_instances

  setup do
    @category = categories(:three)
    @subcategory = Subcategory.new(name: "playmats", category: @category)
    @subcategory_fixture = subcategories(:one)
  end

  test "should have fixtures" do
    # Testing if the subcatergories.yml file subcatergories are available
    assert @subcategory_fixture.save
  end

  test "should save subcategory" do
    # Testing if any subcategory enterd by the user can be saved (CRUD functionality)
    assert @subcategory.save, "Subcategory did not save successfully: #{@subcategory.errors.full_messages.join(", ")}}"
  end

  test "should find subcategory" do
    # Testing if we can find subcategory using its id and/or name (CRUD functionality)
    @subcategory.save

    expected_sub = Subcategory.find(@subcategory.id)
    assert_equal(expected_sub.id, @subcategory.id)

    expected_sub = Subcategory.find_by(name: @subcategory.name)
    assert_equal(expected_sub.name, @subcategory.name)
  end

  test "should delete subcategory" do
    # Testing if subcategory can be deleted after creation (CRUD functionality)
    @subcategory.save
    assert_difference("Subcategory.count", -1) do
      @subcategory.destroy
    end
  end

  test "should update subcategory" do
    # Test if subcategory can be updated (CRUD functionality)
    fixture_update = "land"
    @subcategory_fixture.update({
      name: fixture_update
    })
    assert_equal("land", @subcategory_fixture.name)
  end

end
