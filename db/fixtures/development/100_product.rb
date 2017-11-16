500.times do |i|
  Product.seed_once(:id) do |product|
    product.id = i + 1
    product.user_id = rand(1..10)
    product.category_id = rand(1..15)
    product.name = "#{ i + 1 }番目の時計"
    product.price = "#{( i + 1 ) * 1000}"
    product.quantity = rand(50..100)
    product.description = "#{ i + 1 }番目の時計の説明です。"
  end
end