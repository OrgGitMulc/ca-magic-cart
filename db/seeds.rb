# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Delete all db then run: 
# rails db:create db:schema:load db:migrate db:seed

# Clear existing data
Product.destroy_all
Subcategory.destroy_all
Category.destroy_all

# Create categories
category1 = Category.create(name: 'Singles')
category2 = Category.create(name: 'Booster')
category3 = Category.create(name: 'Accessory')

# Create subcategories
sub_cat1 = Subcategory.create(name: 'Card', category: category1)
sub_cat2 = Subcategory.create(name: 'Token', category: category1)
sub_cat3 = Subcategory.create(name: 'Booster Box', category: category2)
sub_cat4 = Subcategory.create(name: 'Sleeves', category: category3)
sub_cat5 = Subcategory.create(name: 'Deck Box', category: category3)


# Create products
Product.create(name: "Yuriko, the Tiger's Shadow", description: "Legendary Creature", price: 9.99, category: category1, subcategory: sub_cat1)
Product.create(name: "Fatal Push", description: "Sorcery", price: 1.99, category: category1, subcategory: sub_cat2)
Product.create(name: "Dominaria Remastered Draft Booster", description: "Booster Pack", price: 8.00, category: category2)
Product.create(name: "Commander Legends Play Booster", description: "Booster Pack", price: 8.00, category: category2, subcategory: sub_cat3)
Product.create(name: "Dragon Shield Sleeves", description: "100 pack", price: 10.99, category: category3, subcategory: sub_cat4)
Product.create(name: "Ultra Pro Deck Box", description: "Holds 100 cards", price: 19.99, category: category3, subcategory: sub_cat5)