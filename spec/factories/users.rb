FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '00000a' }
    password_confirmation { password }
    family_name           { '浦島' }
    first_name            { '太郎' }
    family_name_kana      { 'ウラシマ' }
    first_name_kana       { 'タロウ' }
    barth_day             { '2000-01-01' }
  end
end
