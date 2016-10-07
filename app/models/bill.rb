class Bill < ApplicationRecord
  belongs_to :entry
  has_many :items
end
