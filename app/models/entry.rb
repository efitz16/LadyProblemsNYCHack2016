class Entry < ApplicationRecord
  belongs_to :user
  has_many :bills

  def self.search(text)
  	search_term = /#{text}/i;

  	result = self.all.order(:procedure_name).where("procedure_name ILIKE ?", "%#{text}%").limit(100)

  	results = result.sort{|x, y| (x =~ search_term) <=> (y =~ search_term) }
  end
end
