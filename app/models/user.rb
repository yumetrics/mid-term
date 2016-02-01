class User < ActiveRecord::Base

  has_many :items
  validates :name, presence: true
  validates :password, presence: true

end