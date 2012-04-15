# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([ {:email => "user@email.com", :password_hash => "", :password_salt => "", :name => "user", :address => "bandung", :phonenumber => "007", :birthday => "01/01/2012", :gender => "0", :facebook => "user@mail.com", :blog => "user.bloger.spot"}, {:email => "user@email.com", :password_hash => "", :password_salt => "", :name => "user", :address => "bandung", :phonenumber => "007", :birthday => "01/01/2012", :gender => "0", :facebook => "user@mail.com", :blog => "user.bloger.spot"}, {:email => "user@email.com", :password_hash => "", :password_salt => "", :name => "user", :address => "bandung", :phonenumber => "007", :birthday => "01/01/2012", :gender => "0", :facebook => "user@mail.com", :blog => "user.bloger.spot"} ])

categories = Category.create([ {:name => "Automotive"}, {:name => "Car", :parent_id => "1"} ])

products = Product.create([ {:name => "Kijang", :description => "Car Family", :price => "6000", :weight => "545", :user_id => "1", :category_id => "1"}, {:name => "Panter", :description => "Car Adventure", :price => "7000", :weight => "700", :user_id => "1", :category_id => "1"}, {:name => "Eagle", :description => "City Car", :price => "3400", :weight => "232", :user_id => "2", :category_id => "1"} ])

articles = Article.create([ {:title => "Turbo Car", :body => "Best racing car has arrive, with new technology", :user_id => "1"}, {:title => "Flying Car", :body => "Flyibg car has arrive, with new technology", :user_id => "1"}, {:title => "007 Car", :body => "007 racing car has arrive, with new technology", :user_id => "2"} ])

comments = Comment.create([ {:comment => "cool", :article_id => "2", :user_id => "2"}, {:comment => "cool", :article_id => "1", :user_id => "3"}, {:comment => "cool", :article_id => "3", :user_id => "2"}, {:comment => "cool", :article_id => "3", :user_id => "1"} ])
