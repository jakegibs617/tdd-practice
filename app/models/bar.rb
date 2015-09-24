class Bar < ActiveRecord::Base
  has_many :reviews
	
	validates :title, uniqueness: true, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
end
