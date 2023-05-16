# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Faker::Name.name      #=> "Christophe Bartell"

Faker::Address.full_address #=> "5479 William Way, East Sonnyhaven, LA 63637"

Faker::Markdown.emphasis #=> "Quo qui aperiam. Amet corrupti distinctio. Sit quia *dolor.*"

Faker::TvShows::RuPaul.queen #=> "Violet Chachki"

Faker::Alphanumeric.alpha(number: 10) #=> "zlvubkrwga"

Faker::ProgrammingLanguage.name #=> "Ruby"
