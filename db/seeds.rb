# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   name: '管理者',
   email: ENV['SECRET_ID'],
   password: ENV['SECRET_KEY'],
   password_confirmation: ENV['SECRET_KEY']
)

User.create!(
   [
     {
       email: 'test1@email.com',
       last_name: '高橋',
       first_name: '健一',
       user_name: 'けんちゃん',
       grade: '大学1年生',
       phone_number: '07011111111',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test1111',
       password_confirmation:'test1111',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test2@email.com',
       last_name: '林',
       first_name: '孝明',
       user_name: 'たかさん',
       grade: '大学2年生',
       phone_number: '0702222222',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test2222',
       password_confirmation:'test2222',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test3@email.com',
       last_name: '境',
       first_name: '伸一',
       user_name: 'しん',
       grade: '大学3年生',
       phone_number: '0703333333',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test3333',
       password_confirmation:'test3333',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test4@email.com',
       last_name: '田中',
       first_name: '亘',
       user_name: 'わったー',
       grade: '大学4年生',
       phone_number: '0704444444',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test4444',
       password_confirmation:'test4444',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test5@email.com',
       last_name: '早川',
       first_name: '康介',
       user_name: 'こうちゃん',
       grade: '大学3年生',
       phone_number: '0705555555',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test5555',
       password_confirmation:'test5555',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test6@email.com',
       last_name: '米津',
       first_name: '竜也',
       user_name: 'たつ',
       grade: '大学3年生',
       phone_number: '0706666666',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test6666',
       password_confirmation:'test6666',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test7@email.com',
       last_name: '武藤',
       first_name: 'すばる',
       user_name: 'すばる',
       grade: '大学3年生',
       phone_number: '0707777777',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test7777',
       password_confirmation:'test7777',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test8@email.com',
       last_name: '上田',
       first_name: '浩',
       user_name: '上ちゃん',
       grade: '大学3年生',
       phone_number: '0708888888',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test8888',
       password_confirmation:'test8888',
       is_active: true,
       offer_id: ''
    },
    {
       email: 'test9@email.com',
       last_name: '渡部',
       first_name: '祐介',
       user_name: 'わた',
       grade: '大学3年生',
       phone_number: '0709999999',
       learning_status: false,
       other_grade: '',
       image_id: '',
       password: 'test9999',
       password_confirmation:'test9999',
       is_active: true,
       offer_id: ''
    }
  ]
)

Requester.create!(
  [
    {
   email: 'requester1@email.com',
   name: '渡辺',
   business_name: '株式会社Connection Box',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '07011111111',
   password: 'requester11',
   password_confirmation:'requester11',
   is_active: true
 },
 {
   email: 'requester2@email.com',
   name: '小林',
   business_name: 'オンライン学習塾ROOL',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0702222222',
   password: 'requester22',
   password_confirmation:'requester22',
   is_active: true
 },
 {
   email: 'requester3@email.com',
   name: '馬場',
   business_name: '株式会社馬場',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0703333333',
   password: 'requester33',
   password_confirmation:'requester33',
   is_active: true
 },
 {
   email: 'requester4@email.com',
   name: '粕谷',
   business_name: '株式会社Record Book',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0704444444',
   password: 'requester44',
   password_confirmation:'requester44',
   is_active: true
 },
 {
   email: 'requester5@email.com',
   name: '堀江',
   business_name: '株式会社Stock Revolution',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0705555555',
   password: 'requester55',
   password_confirmation:'requester55',
   is_active: true
 }
]
)

Company.create!(
  [
    {
   email: 'company1@email.com',
   name: '株式会社Connection Box',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '07011111111',
   is_active: true,
   password: 'company11',
   password_confirmation:'company11',
   is_active: true
 },
 {
   email: 'company2@email.com',
   name: '株式会社エコシステム',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0702222222',
   is_active: true,
   password: 'company22',
   password_confirmation:'company22',
   is_active: true
 },
 {
   email: 'company3@email.com',
   name: '株式会社SquadGoals',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0703333333',
   is_active: true,
   password: 'company33',
   password_confirmation:'company33',
   is_active: true
 },
 {
   email: 'company4@email.com',
   name: '株式会社Gateway',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0704444444',
   is_active: true,
   password: 'company44',
   password_confirmation:'company44',
   is_active: true
 },
 {
   email: 'company5@email.com',
   name: '株式会社ネクストステーション',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0705555555',
   is_active: true,
   password: 'company55',
   password_confirmation:'company55',
   is_active: true
 },{
   email: 'company6@email.com',
   name: '株式会社未来の希望',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0706666666',
   is_active: true,
   password: 'company66',
   password_confirmation:'company66',
   is_active: true
 },{
   email: 'company7@email.com',
   name: '株式会社ファッションスタンド',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0707777777',
   is_active: true,
   password: 'company77',
   password_confirmation:'company77',
   is_active: true
 },{
   email: 'company8@email.com',
   name: '株式会社blackbox',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0708888888',
   is_active: true,
   password: 'company88',
   password_confirmation:'company88',
   is_active: true
 },{
   email: 'company9@email.com',
   name: '株式会社cat',
   postal_code: '1111111',
   address: '東京都台東区',
   phone_number: '0709999999',
   is_active: true,
   password: 'company99',
   password_confirmation:'company99',
   is_active: true
 }
]
)

Category.create!(
  [{name: "プログラミング"},{name: "動画編集"},{name: "デザイン"},{name: "マーケティング"},{name: "その他"}]
)

50.times do |i|
  ScholasticRecord.create!(
    [
      {
    learning_time: "3",
    learning_time_min: "15",
    learning_content: "プログラミング",
    learning_detail: "rails",
    user_id: "4",
    category_id: "1"
  },{
    learning_time: "2",
    learning_time_min: "30",
    learning_content: "動画編集",
    learning_detail: "動画編集教材",
    user_id: "3",
    category_id: "2"
  },{
    learning_time: "2",
    learning_time_min: "45",
    learning_content: "デザイン",
    learning_detail: "デザイン本",
    user_id: "2",
    category_id: "3"
  },{
    learning_time: "0",
    learning_time_min: "30",
    learning_content: "マーケティング",
    learning_detail: "SNS運用",
    user_id: "2",
    category_id: "4"
  }
  ]
  )
end