# here is where we will create some see date to work with and test associations

#create  user

patrice = User.create(name: "Patrice", email: "patrice@patrice.com", password: "password")

#Create some shoe ShoeEntries

ShoeEntry.create(name: "Pigalle Follies", brand: "Christian Louboutin", style: "Heel" user: patrice)
