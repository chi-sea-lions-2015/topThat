require 'faker'


20.times do
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)
end


5.times do
  users = User.all
  users.each do |user|
    user.videos.create!(title: Faker::Name.title, winner:[true, false].sample, data_content: Faker::Internet.url)
  end
end

50.times do
  Vote.create!(voter: User.all.sample, video: Video.all.sample)
end

# 50.times do
#   UserConnection.create!(inviter: User.all.sample, invitee: User.all.sample)
# end

5.times do
 PrivateArena.create!(challenger_video: Video.all.sample, challengee_video: Video.all.sample)
end

5.times do
 PublicArena.create!(challenger_video: Video.all.sample, challengee_video: Video.all.sample)
end

5.times do
 ArenaAttendance.create!(attendee: User.all.sample, private_arena: PrivateArena.all.sample)
end



