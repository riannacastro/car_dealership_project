# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.create([
    {year:1995, make:"Toyota", model:"Corolla"},
    {year:2002, make:"Toyota", model:"Camry"},
    {year:2008, make:"Scion", model:"tC"},
    {year:2012, make:"Ford", model:"Flex"}
])

# seed data not showing in rails console