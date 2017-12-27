FactoryBot.define do
  factory :recipe do
    title 'Beef stew'
    description 'This is great'
    ingredients '1kg of beef'
    preparation 'Cut beef'
    directions 'Cook beef'
    image_url 'image.com'
    prep_time '10m'
    cooking_time '15m'
    serves 8
  end
end
