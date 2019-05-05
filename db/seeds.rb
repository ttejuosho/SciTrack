# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#registries = Registry.create([
#    { name: 'Cancer Study', location: 'Chicago', state: 'Open' }, 
#    { name: 'Fetus Study', location: 'Evanston', state: 'Closed' } ])

# coordinators = Coordinator.create!([
#     {
#         name: "Damon Chad",
#         email: "dchad@yahoo.com",
#         phone_number: 7736239941
#     }
# ])

participants = Participant.create!([
    {
        name: "John Appleseed",
        email: "johnappleseed@outlook.com",
        gender: "male",
        date_of_birth: 19540805,
        phone_number: 8157456621,
        method_of_contact: "email",
        remarks: "",
        Coordinator: "Damon Chad"
    }
])

