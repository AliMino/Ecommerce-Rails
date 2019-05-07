# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Order.destroy_all
Brand.destroy_all
Store.destroy_all
Category.destroy_all
Product.destroy_all
Copon.destroy_all
User.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
brands=Brand.create!(id: 1 ,name: 'Airbnb')
brands=Brand.create!(id: 2 ,name: 'Apple')
brands=Brand.create!(id: 3 ,name: 'Nike')
brands=Brand.create!(id: 4 ,name: 'BT')
brands=Brand.create!(id: 5 ,name: 'Dove')

category=Category.create(id: 1,name: 'tv')
category=Category.create(id: 2,name: 'mobile')
category=Category.create(id: 3,name: 'labtop')
category=Category.create(id: 4,name: 'Clothing')
category=Category.create(id: 5,name: 'shoes')
 

product=Product.create(id: 1 ,price: 30,quantity: 10,title: "product1",description: "this is the first product",brand_id: 1, category_id: 1,user_id: 1 )

User.create!([
    {id: 1,email: "testadmin@mvmanor.co.uk", password: "testadminuser", password_confirmation: "testadminuser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: 'admin' ,role:2,avatar: "back.png" },
    {id: 2,email: "testuser@mvmanor.co.uk", password: "testuseraccount", password_confirmation: "testuseraccount", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: 'seller' ,role:1 ,avatar: "back.png"},
    {id: 3,email: "testcustomer@customer.co.uk", password: "testcustomeruser", password_confirmation: "testcustomeruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil,name: 'buyer' ,role:0,avatar: "back.png" }
  ])