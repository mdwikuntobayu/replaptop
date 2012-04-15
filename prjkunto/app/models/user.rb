class User < ActiveRecord::Base
  has_many :products
  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
