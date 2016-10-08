class Entry < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy
  has_many :bill_items, through: :bills, source: :item

  validates :user, { presence: true }

  STATES = ["AK","AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]

  def self.search(text)
  	search_term = /#{text}/i;

  	result = self.all.order(:procedure_name).where("procedure_name ILIKE ?", "%#{text}%").limit(100)

  	results = result.sort{|x, y| (x =~ search_term) <=> (y =~ search_term) }
  end
end
