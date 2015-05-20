class User < ActiveRecord::Base
  has_many :lists
  
  validates :password, presence: true
  validates :username, presence: true
  
end
