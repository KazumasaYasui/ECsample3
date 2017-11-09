10.times do |i|
  User.seed_once(:id) do |user|
    user.id = i + 1
    user.name = "管理者#{ i + 1 }番さん"
    user.email = "#{ i + 1 }@email.com"
    user.admin = true
    user.password = 111101 + i
    user.password_confirmation = 111101 +i 
  end
end