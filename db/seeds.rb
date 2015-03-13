# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.new(
    username: "貝基塔",
    email: 'phyala@gmail.com',
    password: "password",
    password_confirmation: "password",
    is_admin: true,
    is_super_admin: true,
    is_admin_manager: true,
    is_customer_service_manager: true,
    is_product_manager: true
)
u.save!