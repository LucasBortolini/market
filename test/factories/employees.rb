FactoryBot.define do
  factory :employee do
    name { FFaker::Name.name }
    pis { '%010d' % rand(10 ** 10) }
    phone { FFaker::PhoneNumberBR.phone_number }
    admission_date { rand(5.years).seconds.ago }
    job { FFaker::Company.position }
    salary { [1000, 2000, 2500].sample }
  end
end