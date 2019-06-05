class Item < ApplicationRecord
  # model associationo
  belongs_to :todo
  # validation
  validates_presence_of :name
end
