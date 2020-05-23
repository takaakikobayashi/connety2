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
   email: 'test1@email.com',
   last_name: '小林',
   first_name: '孝明',
   user_name: 'たかぽん',
   grade: '大学3年生',
   phone_number: '07011111111',
   learning_status: false,
   other_grade: '',
   image_id: '',
   password: 'test1111',
   password_confirmation:'test1111'
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
   password: 'requester1',
   password_confirmation:'requester1'
)