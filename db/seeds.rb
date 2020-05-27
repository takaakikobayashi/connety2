# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: '管理者',
   email: 'admin@email.com',
   password: 'admin1',
   password_confirmation:'admin1'
)

User.create!(
   [
     {
       email: 'test1@email.com',
       last_name: '小林',
       first_name: '孝明',
       user_name: 'たかぽん',
       grade: '2',
       phone_number: '07011111111',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test1111',
       password_confirmation:'test1111'
    },
    {
       email: 'test2@email.com',
       last_name: '林',
       first_name: '孝明',
       user_name: 'たかさん',
       grade: '0',
       phone_number: '0702222222',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test2222',
       password_confirmation:'test2222'
    },
    {
       email: 'test3@email.com',
       last_name: '小林',
       first_name: '明',
       user_name: 'たか',
       grade: '1',
       phone_number: '0703333333',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test3333',
       password_confirmation:'test3333'
    },
    {
       email: 'test4@email.com',
       last_name: '林',
       first_name: '明',
       user_name: 'はやし',
       grade: '6',
       phone_number: '0704444444',
       learning_status: true,
       other_grade: '社会人',
       image_id: '',
       password: 'test4444',
       password_confirmation:'test4444'
    }
  ]
)

Requester.create!(
   email: 'requester1@email.com',
   name: '小林',
   business_name: '株式会社小林',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '07011111111',
   password: 'requester1',
   password_confirmation:'requester1'
)

Company.create!(
   email: 'company1@email.com',
   name: '株式会社小林',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '07011111111',
   is_active: true,
   password: 'company1',
   password_confirmation:'company1'
)

Category.create!(
  [{name: "プログラミング"},{name: "動画編集"},{name: "デザイン"},{name: "マーケティング"},{name: "その他"}]
)