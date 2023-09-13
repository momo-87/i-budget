require 'faker'

Group.destroy_all
Entity.destroy_all
User.destroy_all

nb_users = 5
nb_groups = 5
nb_entities = 5
users = []
groups = []
entities = []
icons = ["https://place-hold.it/100/red", "https://place-hold.it/100/green", "https://place-hold.it/100/white", "https://place-hold.it/100/gray", "https://place-hold.it/100/ffbb5c", "https://place-hold.it/100/c63d2f", "https://place-hold.it/100/ea1179"]
amounts = [100, 50, 95, 2500, 33, 145, 85, 175, 650, 1465]


for user_position in 1..nb_users do
  temp_user = User.create!(name: "User Number #{user_position}", email: "user#{user_position}@ibudget.com", password: "ibudget#{user_position}")
  users << temp_user
end

for user_position in 0..(nb_users - 1) do
  for group_position in 0..Random.rand(nb_groups -1) do
    temp_group = Group.new(user: users[user_position], name: "Category ##{group_position + 1}", icon: icons.sample)
    groups << temp_group
  end

  for entity_position in 0..Random.rand(nb_entities -1) do
    temp_entity = Entity.new(author: users[user_position], name: "Transaction ##{entity_position + 1}", amount: amounts.sample)
    entities << temp_entity
  end
end

for i in 0..Random.rand(groups.size - 1) do
  for j in 0..Random.rand(entities.size - 1)
    groups[i].entities << entities[j] if groups[i].user_id == entities[j].author_id
    groups[i].save
  end
end

puts "Created #{User.count} users"
puts "Created #{Group.count} groups"
puts "Created #{Entity.count} entities"
