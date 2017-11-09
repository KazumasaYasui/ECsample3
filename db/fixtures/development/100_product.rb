1000.times do |i|
  Product.seed_once(:id) do |product|
    product.id = i + 1
    product.user_id = rand(1..10)
    product.category_id = rand(1..15)
    product.name = "#{ i + 1 }番目の商品です"
    product.price = "#{( i + 1 ) * 1000}"
    product.description = "#{ i + 1 }番目の商品の説明です"
  end
end