FactoryBot.define do
  factory :salon do
    store_name      { 'トータルビューティーサロンBASARA'}
    corporate_name  { '株式会社BASARA'}
    prefecture_id   { '14' }
    city            { '世田谷区太子堂' }
    street_number   { '2-24-6' }
    building_name   { 'ドミー三軒茶屋' }
    station         { '三軒茶屋駅徒歩7分' }
    established     { '2012' }
    offices         { '3' }

    after(:build) do |salon|
      salon.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
