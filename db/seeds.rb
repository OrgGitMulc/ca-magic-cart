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

# Clear existing data
Product.destroy_all
Subcategory.destroy_all
Category.destroy_all

# Create categories and subcategories
accessories = Category.create!(name: "Accessories")
sleeves = Subcategory.create!(name: "Sleeves", category: accessories)
deck_boxes = Subcategory.create!(name: "Deck Boxes", category: accessories)
play_mats = Subcategory.create!(name: "Play Mats", category: accessories)

# Create some products (optional)
Product.create!(name: "Dragon Shield Sleeves", description: "100 pack", price: 10.99, category: accessories, subcategory: sleeves)
Product.create!(name: "Ultra Pro Deck Box", description: "Holds 100 cards", price: 9.99, category: accessories, subcategory: deck_boxes)