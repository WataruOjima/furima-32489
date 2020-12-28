FactoryBot.define do
  factory :user do
    nickname              { 'tarou' }
    email                 { 'sample@gmail.com' }
    password              { 'abcd123' }
    encrypted_password    { 'abcd123' }
    last_name             { '山田' }
    furigana_last_name    { 'ヤマダ' }
    first_name            { '太郎' }
    furigana_first_name   { 'タロウ' }
    birth_date            { '2000-01-01' }
  end
end
