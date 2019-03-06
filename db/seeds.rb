# here is where we will create some see date to work with and test associations

#create 2 CreateUsersTable

patrice = User.create!(name: "Patrice", email: "patrice@patrice.com", password: "password")
jb = User.create!(name: "JB", email: "jb@jb.com", password: "password")


#Create some shoe ShoeEntries

ShoeEntry.create!(name: "Christian Louboutin", user: patrice)

#Use AR to pre-associate data:
patrice.shoe_entries.create!(name: "Jimmy Choo")

jbs_entry = jb.shoe_entries.build(name: "Air Jordan")
jbs_entry.save
