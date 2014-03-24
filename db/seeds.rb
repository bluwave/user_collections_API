# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


john = User.create(:email => "Gr5@trulia.com", :apns_token =>"996e85f2e7470f62a42d28800f126b1428b64450dda383f6a02d71a2cca8d84d" )
# john = User.create(:email => "Gr5@trulia.com", :apns_token =>"96020748564c6c78f83bbae89c608a96d2f7a778b0b5016999a57fc2ded9f16c" ) # ipod touch
jane = User.create(:email => "Jane@doe.com", :apns_token => "dbe890d850ba483d4ea93f2cb6b8aa4deb00696d068917dbda68cecdd0e4ccc0")
c1 = Collection.create(:name => "homes my wife does not like" )
CollectionConnection.create(:collection => c1, :user => john)
CollectionConnection.create(:collection => c1, :user => jane)

# m =  Message.create(:collection => c1 , :notes => "hello world", :user =>john)




#   this simulates some of the difficult joins that you have to do to search
#   by pdp_id

# c1 = Collection.create(:name => "sf homes" )
# c2 = Collection.create(:name => "oakland homes" )
# CollectionConnection.create(:collection => c1, :user => john)
# CollectionConnection.create(:collection => c1, :user => jane)
#
# CollectionConnection.create(:collection => c2, :user => john)
# CollectionConnection.create(:collection => c2, :user => jane)
#
# m =  Message.create(:collection => c1 , :notes => "test 1", :pdp_id => "a", :user =>john)
# m =  Message.create(:collection => c1 , :notes => "test 2 ", :pdp_id => "c", :user =>john)
# m =  Message.create(:collection => c1 , :notes => "test 3", :pdp_id => "a", :user =>john)
# m =  Message.create(:collection => c1 , :notes => "test 4 ", :pdp_id => "d", :user =>john)
# m =  Message.create(:collection => c1 , :notes => "test 5 ", :pdp_id => "a", :user =>jane)
#
#
# m =  Message.create(:collection => c2 , :notes => "[oak] test 6 ", :pdp_id => "a", :user =>jane)
