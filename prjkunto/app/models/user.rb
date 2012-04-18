class User < ActiveRecord::Base
  has_many :products
  has_many :articles, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  validates :name, :presence => true, :length => {:maximum => 20}, :format => {:with => /\A[a-zA-Z]+\z/, :message => "Must Letter"}

  validates :email, :presence => true, :uniqueness => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  attr_accessor :password
  before_save :encrypt_password
  validates :password, :presence => {:on => :create}, :confirmation => true
  validates :address, :presence => true
  

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,  password_salt)
    end
  end

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def is_admin?
    self.email == "ujang@kunto.co.id"
  end
  
end
