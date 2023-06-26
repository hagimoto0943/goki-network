10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 1234567890,
    password_confirmation: 1234567890
  )
end

20.times do |index|
  Post.create(
    user: User.offset(rand(User.count)).first,
    title: "タイトル#{index}",
    body: "本文#{index}",
    post_types: 0
  )
end
