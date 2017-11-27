FactoryBot.define do
  factory :order do

    cust_name "山田太郎"
    cust_email "test_sample@email.com"
    cust_tel "080-1234-5678"
    cust_postal_code "1234567"
    cust_prefecture 12
    cust_city "東京都千代田区"
    cust_street "１−７−１"
  end
end
