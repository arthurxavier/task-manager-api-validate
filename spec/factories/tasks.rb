FactoryGirl.define do
  factory  :task do
    title { Faker::Lorem.sentence}  #gera frase aleatoria
    description { Faker::Lorem.paragraph } #gera um paragrafo
    deadline {Faker::Date.forward}  #gera data futura
    done false
    user
  end
end