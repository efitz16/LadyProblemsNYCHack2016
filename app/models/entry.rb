class Entry < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy
  has_many :bill_items, through: :bills, source: :item

  validates :user, { presence: true }
end
