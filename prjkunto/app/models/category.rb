class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  
  scope :parent_category, where("parent_id = nil")
  scope :child_category, where("parent_id = '1'") 
end
