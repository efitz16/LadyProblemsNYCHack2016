class Item < ApplicationRecord
  belongs_to :bill

  validates :bill, :item_name, { presence: true }
end
