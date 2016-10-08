class Item < ApplicationRecord
  belongs_to :bill

  validates :bill, { presence: true }
end
