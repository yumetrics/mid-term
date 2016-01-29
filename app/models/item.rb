require_relative '_messages'

# i = [1, 2, 3, 4, 5]
# i.sample

class Item < ActiveRecord::Base

  belongs_to :user

  validates :desired_name, presence: true, format: {with: /\A[a-zA-Z][\sa-zA-Z]*\z/}
  validates :desired_price, presence: true, numericality: {integer_only: true, greater_than: 5, less_than: 1_000_000_000}
  validates :base_name, presence: true
  validates :base_price, presence: true, numericality: {integer_only: true, greater_than: 0}

def threshold
  # i = [0, 1, 2, 3 ,4]
  # x = (0..4)
  if desired_price < (base_price * 20)
    Messages::TYPE1.sample
  elsif desired_price < (base_price * 100)
    Messages::TYPE2.sample
  elsif desired_price < (base_price * 1000)
    Messages::TYPE3.sample
  elsif desired_price < (base_price * 10000)
    Messages::TYPE4.sample
  elsif desired_price >= (base_price * 10000)
    Messages::TYPE5.sample
  end
end

end