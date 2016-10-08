class Bill < ApplicationRecord
  belongs_to :entry
  has_many :items, dependent: :destroy

  validates :entry, :total_without_coverage, :final_cost, { presence: true }

end
