puts "🌱 Creating Users..."

# user1 = BnbUser.create(username: "user1", password: "password", email: "user1@example.com", avatar: "user1.jpg", full_name: "User One", account_type: "Host")
# user2 = BnbUser.create(username: "user2", password: "password", email: "user2@example.com", avatar: "user2.jpg", full_name: "User Two", account_type: "Guest")

user1 = BnbUser.find_by(id: 1)
user2 = BnbUser.find_by(id: 2)
puts "✅ Done!"


# puts "🌱 Creating wallets..."

# Payment.create(amount: 1000, user_id: user1.id)
# Payment.create(amount: 1000, user_id: user2.id)

# puts "✅ Done!"

puts "🌱 Creating Hotels..."

BnbRoom.create(name: "Bnb Palace", address: "Kahawa, Ngong Rd", bnb_type: "3 Bedroom", 
    price: 100, bnb_image: "https://www.amazinginteriordesign.com/wp-content/uploads/2017/07/Amazing-2-Single-Beds-Room-Ideas-fi.jpg", 
    features: "Has three bedrooms with large TV, fridge and a large sititng room", bed: 3, size: 1500, wifi: true, electronics: true, booked: false, bnb_user_id: user1.id)

BnbRoom.create(name: "Paramount Hotel", address: "Tom Mboya St, Nairobi", bnb_type: "1 Bedroom", 
    price: 70, bnb_image: "https://images.kenyapropertycentre.com/properties/images/2648/05f1ae9cdb1090-classic-1-bedroom-apartment-for-rent-westlands-nairobi.jpg", 
    features: "Has single bedrooms with 32inch TV and full kitchen", bed: 3, size: 1500, wifi: true, electronics: true, booked: false, bnb_user_id: user2.id)

BnbRoom.create(name: "Maziwa Gardens", address: "Ngong, Ngong Forest Rd.", bnb_type: "Bedsitter", 
    price: 50, bnb_image: "https://assets-news.housing.com/news/wp-content/uploads/2020/06/24181135/Everything-you-need-to-know-about-studio-apartments-FB-1200x700-compressed.jpg", 
    features: "Stylish design with basic electronics", bed: 1, size: 500, wifi: false, electronics: false, booked: false, bnb_user_id: user1.id)

puts "✅ Done!"