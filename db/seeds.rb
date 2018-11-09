# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users table
User.create(email: 'hola@cartelerai.com', password: '123456', first_name: 'Julio', last_name: 'Noriega', office: 'Tec de Monterrey Campus Monterrey', campus: 'MTY', user_type: 'admin', is_newbie: false)
User.create(email: 'luiscfgmay294@gmail.com', password: '123456', first_name: 'Luis', last_name: 'Flores', office: 'Tec de Monterrey Campus Monterrey', campus: 'MTY', user_type: 'sponsor', is_newbie: true)
User.create(email: 'azael.capetillo@itesm.mx', password: 'azael123', first_name: 'Azael Jesus', last_name: 'Cortes Capetillo', office: 'Tec de Monterrey Campus Monterrey', campus: 'MTY', user_type: 'sponsor', is_newbie: false)
User.create(email: 'adiazdeleon@itesm.mx', password: 'alejandra123', first_name: 'Alejandra', last_name: 'Díaz de Leon Lastras', office: 'Tec de Monterrey Campus Monterrey', campus: 'MTY', user_type: 'admin', is_newbie: false)
User.create(email: 'applicant@mail.com', password: '123456', first_name: 'Juan', last_name: 'Perez', office: 'Tec de Monterrey Campus Monterrey', campus: 'MTY', user_type: 'applicant', is_newbie: false)


# Categories table
Category.create(name: 'Tecnología y soluciones', enabled: true)
