class Event < ApplicationRecord

	
	has_many :attendances
	has_many :users, through: :attendances
	has_many :users
	belongs_to :admin, class_name:"User"
	


	validates :start_date,
	presence: true,
	if: :validate_start_date

	validates :duration,
	presence: true,
	numericality: {greater_than: 0}

	validates :title,
	presence: true,
	length: {in: 5..140}

	validates :description,
	presence: true,
	length: {in: 20..1000}

	validates :price,
	presence: true,
	numericality: {only_integer: true},
	inclusion: {in: 1..1000}

	validates :location,
	presence: true

	private
	

	def validate_start_date
  errors.add(:start_date, "can't be in the past") if
    !start_date.blank? and start_date < Date.today
	end	
end
