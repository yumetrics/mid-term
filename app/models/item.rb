class Item < ActiveRecord::Base

  belongs_to :user

  validates :desired_name, presence: true
  validates :desired_price, presence: true, numericality: {integer_only: true, greater_than: 5}
  validates :base_name, presence: true
  validates :base_price, presence: true, numericality: {integer_only: true, greater_than: 0}

end