# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


john = User.create(:email => "Gr5@trulia.com", :apns_token =>"996e85f2e7470f62a42d28800f126b1428b64450dda383f6a02d71a2cca8d84d" )
jane = User.create(:email => "Jane@doe.com", :apns_token => "dbe890d850ba483d4ea93f2cb6b8aa4deb00696d068917dbda68cecdd0e4ccc0")
c1 = Collection.create(:name => "homes my wife does not like" )
CollectionConnection.create(:collection => c1, :user => john)
CollectionConnection.create(:collection => c1, :user => jane)

# m =  Message.create(:collection => c1 , :notes => "hello world", :user =>john)
