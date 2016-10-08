class Bill < ApplicationRecord
  belongs_to :entry
  has_many :items, dependent: :destroy

  validates :entry, { presence: true }

end
