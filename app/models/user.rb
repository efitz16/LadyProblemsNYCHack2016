class User < ApplicationRecord
	has_many :entries, dependent: :destroy
  has_secure_password
  validates :username, :email, presence:true, uniqueness:true
  validates :password, length: {minimum: 8, maximum: 50}
  validates_confirmation_of :password
  validates :birthday, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  STATES = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VA", "VT", "WA", "WI", "WV", "WY"]

  INSURANCE_COMPANIES = [" ", "Lady Problems Insurance", "Hackathon Insurance", "Unitedhealth Group", "Wellpoint Inc. Group", "Kaiser Foundation Group", "Humana Group", "Aetna Group", "HCSC Group", "Cigna Health Group", "Highmark Group", "Coventry Corp. Group", "HIP Insurance Group", "Independence Blue Cross Group", "Blue Cross Blue Shield of New Jersey Group", "Blue Cross Blue Shield of Michigan Group", "California Physicians' Service", "Blue Cross Blue Shield of Florida Group", "Health Net of California, Inc.", "Centene Corp. Group", "Carefirst Inc. Group", "Wellcare Group", "Blue Cross Blue Shield of Massachusetts Group", "UHC of California", "Lifetime Healthcare Group", "Cambia Health Solutions Inc.", "Metropolitan Group", "Molina Healthcare Inc. Group", "Other"]

  RACE = ['American Indian or Alaska Native', 'Asian', 'Black or African American', 'Native Hawaiian or Other Pacific Islander', 'White', 'Hispanic or Latino', 'Other']

	def age
	  dob = self.birthday
	  months = (Date.today.year * 12 + Date.today.month) - (dob.year * 12 + dob.month)
	  months / 12
	end

end
