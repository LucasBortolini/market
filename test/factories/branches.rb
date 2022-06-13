FactoryBot.define do
  factory :branch do
    name { FFaker::Company.name }
    cnpj { FFaker::IdentificationBR.cnpj }
  end
end