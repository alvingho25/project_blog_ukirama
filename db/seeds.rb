User.create!(name:  "Alvin",
             email: "alvin@alvin.com",
             password: "password",
             is_admin: true)

9.times do |n|
name  = "Alvin#{n+1}"
email = "alvin-#{n+1}@alvin.com"
User.create!(name:  name,
            email: email,
            password: "password")
end

users = User.all
5.times do |i|
    summary = "Lorem Ipsum #{i}"
    content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tincidunt pretium tristique. Curabitur eleifend consequat hendrerit. Vivamus maximus sed metus et facilisis. Pellentesque pellentesque odio at condimentum feugiat. Suspendisse sit amet magna felis. Mauris porta enim congue elit eleifend, et ullamcorper ligula malesuada. Nullam consequat quis dolor et sollicitudin. In ex velit, congue eget ligula et, euismod consectetur felis. Vivamus a erat et mi bibendum rutrum. Vestibulum ut nibh odio. Interdum et malesuada fames ac ante ipsum primis in faucibus."
    users.each { |user| user.blog_posts.create!(title: "#{user.name} title number #{i}",
                                         summary: summary,
                                         content: content) }
end