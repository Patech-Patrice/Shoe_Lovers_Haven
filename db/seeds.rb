# here is where we will create some see date to work with and test associations

#create  user

patrice = User.create(name: "Patrice", email: "patrice@patrice.com", password: "password")

#Create some shoe ShoeEntries

ShoeEntry.create(name: "Christian Louboutin", user: patrice)

#Use AR to pre-associate data:
patrice.shoe_entries.create!(name: "Jimmy Choo")
