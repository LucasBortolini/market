FactoryBot.define do
  factory :customer do
    name { FFaker::Name.name }
    cpf { FFaker::IdentificationBR.cpf }
    email { "#{name}@example.com".downcase.gsub(" ", "_") }
    phone { FFaker::PhoneNumberBR.phone_number }
    street { "#{FFaker::AddressBR.street_prefix} #{FFaker::AddressBR.street}" }
    number { rand(2000) }
    cep { FFaker::AddressBR.zip_code }
  end
end