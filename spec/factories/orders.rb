FactoryBot.define do
  factory :order do
    zip_code { '111-1111' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { 'パラシオタワー' }
    tel_number { 11_111_111_111 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
