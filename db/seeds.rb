# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jon = User.create!(email: 'kitty@yahoo.com', password: '1111111111')
emily = User.create!(email: 'opyan@yahoo.com', password: '2222222222')


Article.create({title: '新しい記事だよ', content: 'あああああ'})
Article.create({title: 'ぬおおおおお！', content: 'あああああ'})