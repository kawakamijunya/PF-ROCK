# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 新たにrails db:seedの際は一旦削除するか、findやwhereで検索をかける
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

Tag.create([
    { name: 'メロコア' },
    { name: 'ラウド' },
    { name: 'パンク'},
    { name: 'ハード'},
    { name: 'ポップ'},
    { name: 'オルタナティブ'}
    ])

