# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


john = User.create(:email => "john@doe.com")
jane = User.create(:email => "jane@doe.com")
c1 = Collection.create(:name => "homes near trulia" )
c2 = Collection.create(:name => "homes near concord")
CollectionConnection.create(:collection => c1, :user => john)
CollectionConnection.create(:collection => c1, :user => jane)
CollectionConnection.create(:collection => c2, :user => jane)
