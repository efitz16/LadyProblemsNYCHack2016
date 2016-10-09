class Entry < ApplicationRecord
  belongs_to :user
  has_many :bills, dependent: :destroy
  has_many :bill_items, through: :bills, source: :item

  validates :user, :year, :procedure_name, { presence: true }


  STATES = [" ","AK","AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MH","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","PW","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY"]

  def self.search(text)
  	search_term = /#{text}/i;

  	result = self.all.order(:procedure_name).where("procedure_name ILIKE ?", "%#{text}%")

  	results = result.sort{|x, y| (x =~ search_term) <=> (y =~ search_term) }
  end

  def total_cost
    length = self.bills.count

    if length == 0
      0
    else
      self.bills.map { |bill| bill.final_cost.to_f}.reduce(0, :+)
    end
  end
end
