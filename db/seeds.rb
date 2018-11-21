# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create({ login: 'admin', password: 'admin', email: 'admin@admin.com'})

CurrenciesRelation.create([{ currency_code: 'RUR', currency_name: 'Russian Ruble'},
                           { currency_code: 'USD', currency_name: 'American Dollar', sign: '$'},
                           { currency_code: 'EUR', currency_name: 'Euro', sign: '€'},
                           { currency_code: 'GBP', currency_name: 'Pound Sterling', sign: '£'}
])

ExchangeRate.create({ currency_from_id: 2, currency_to_id: 1, rate: 66.21, is_main_exchange: true})
