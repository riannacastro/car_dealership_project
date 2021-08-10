# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email:"abc@gmail.com", password:"1111")
country1 = Country.create(name: "India")
brand1 = Brand.create(name:"Toyota", year_created:1944, country: country1)

user.cars.create([
    {year:1995, color:"green", model:"Corolla", brand: brand1},
    {year:2002, color:"black", model:"Camry", brand: brand1},
    {year:2008, color:"white", model:"tC", brand: brand1},
    {year:2012, color:"blue", model:"Flex", brand: brand1}
])

# seed data not showing in rails console