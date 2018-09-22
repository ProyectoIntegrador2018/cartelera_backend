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

# Categories table
Category.create(name: 'Tecnología y soluciones', enabled: true)

# Events table
Event.create(photo: 'https://www.shareicon.net/download/2015/09/03/95031_web_512x512.png',
            name: 'Intro a Ruby',
            start_datetime: '2019-04-10T18:00:43.000-05:00',
            location: 'Tec de Monterrey, Aulas 1, 414',
            cancelled: false,
            description: 'Ven y aprende uno de los lenguajes más demandados en la industria de hoy',
            campus: 'MTY',
            cost: '0.0',
            public_event: true,
            end_datetime: '2019-04-10T20:00:43.000-05:00',
            requirements_to_register: '',
            registration_url: '',
            registration_deadline: '2018-05-02T00:00:00.000-05:00',
            schedule: '',
            facebook_url: '',
            twitter_url: '',
            contact_phone: '',
            contact_email: 'kuri@itesm.mx',
            contact_name: 'Abraham Kuri',
            published: true,
            cancel_message: nil,
            languages: [],
            prefix: '',
            has_registration: true,
            pet_friendly: false,
            majors: [],
            has_deadline: true,
            registration_message: '',
            max_capacity: 0)

Event.create(photo: "https://i.pinimg.com/564x/a5/87/f1/a587f12b19bbaf0cec56fe8a46d649a3.jpg",
            name: 'Ayuda a las Tortugas',
            start_datetime: '2018-12-25T22:16:28.000-06:00',
            location: nil,
            cancelled: false,
            description: nil,
            campus: 'MTY',
            cost: nil,
            public_event: true,
            end_datetime: nil,
            requirements_to_register: nil,
            registration_url: nil,
            registration_deadline: nil,
            schedule: nil,
            facebook_url: nil,
            twitter_url: nil,
            contact_phone: nil,
            contact_email: nil,
            contact_name: nil,
            published: true,
            cancel_message: nil,
            languages: [],
            prefix: nil,
            has_registration: true,
            pet_friendly: false,
            majors: [],
            has_deadline: true,
            registration_message: nil,
            max_capacity: 0)

Event.create(photo: 'https://www.studentenergy.org/assets/base/student_energy_logo-964e46be01503945456d00e210713a41.jpg',
            name: 'Student Energy Regional Meeting',
            start_datetime: '2019-04-10T09:00:15.000-05:00',
            location: 'Centro Estudiantil',
            cancelled: false,
            description: 'Un evento que reúne a estudiantes y profesionistas para aprender y debatir sobre los problemas y las tendencias actuales de la energía.',
            campus: 'MTY',
            cost: '0.0',
            public_event: true,
            end_datetime: '2019-04-12T17:00:15.000-05:00',
            requirements_to_register: '',
            registration_url: '',
            registration_deadline: '2018-05-02T00:00:00.000-05:00',
            schedule: '',
            facebook_url: '',
            twitter_url: '',
            contact_phone: '',
            contact_email: 'tecdemonterrey@studentenergy.org',
            contact_name: 'SERM',
            published: true,
            cancel_message: nil,
            languages: [],
            prefix: '',
            has_registration: true,
            pet_friendly: false,
            majors: [],
            has_deadline: true,
            registration_message: 'Nuestro evento funciona gracias a nuestros patrocinadores, OXXO y H-E-B. Gracias por tu registro. Nos vemos pronto',
            max_capacity: 14)
