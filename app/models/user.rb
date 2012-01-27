class User < ActiveRecord::Base
  has_many :events
  has_and_belongs_to_many :events
	
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
	
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :first_name, :last_name, :on => :create
  validates_format_of :password, :with => /^.{8,16}$/, :unless => :update, :message => "must be at least 8 and less than 16 characters"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,255})\Z/
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def is_admin?
		redirect_to root_url if is_admin 
	end
end
