class Entry < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy
  has_many :bill_items, through: :bills, source: :item

  validates :user, { presence: true }

  def self.search(text)
  	search_term = /#{text}/i;

  	result = self.all.order(:procedure_name).where("procedure_name ILIKE ?", "%#{text}%").limit(100)

  	results = result.sort{|x, y| (x =~ search_term) <=> (y =~ search_term) }
  end
end
