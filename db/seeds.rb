['admin', 'support', 'client'].each do |role_name|
  Role.create! name: role_name
end

user1 = User.create(name: 'Admin',
                    surname: 'Admin',
                    email: 'williboelke@gmail.com',
                    password: 'password',
                    password_confirmation: 'password')

user1.add_role 'admin'

user2 = User.create(name: 'User',
                    surname: 'User',
                    email: 'williboelke@outlook.com',
                    password: 'password',
                    password_confirmation: 'password')
user2.add_role 'client'

1.upto(6) do |i|
  Product.create(name: "Shirt #{i}",
                 price: 14 * i,
                 picture: "http://3.bp.blogspot.com/-Qq_fi4HGNXc/Tb-xaPywysI/AAAAAAAAAA0/wnQ72u073eA/s1600/Plain_Blank_T_Shirts.jpg",
                 description: "beschreibung")
end
