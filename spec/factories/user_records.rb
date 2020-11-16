FactoryBot.define do
  factory :user_record do
    token { 'tok_abcdefghijk00000000000000000' }
    zipcode { '111-2222' }
    region_id { 2 }
    city { '横浜市緑区' }
    house { '青山1-1-1' }
    building { '柳ビル103' }
    telephone { '00011112222' }
  end
end
