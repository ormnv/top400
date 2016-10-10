# == Schema Information
#
# Table name: shows
#
#  id                    :integer          not null, primary key
#  title                 :string(255)
#  date                  :date
#  image                 :string(255)
#  link_to_soundcloud    :string(255)
#  link_to_newtown_radio :string(255)
#  description           :text(65535)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Show < ApplicationRecord
	has_many :dj_shows
	# has_many :show_songs
	has_many :songs
	has_many :djs, through: :dj_shows

	# validates :title, presence: true
	# # validates :djs, presence: true
	# validates :date, presence: true
	# validates :description, presence: true

	def djNames
		djs.pluck(:name).join(' , ')
	end

	# Gets count of all shows 
  	def self.number_of_shows
  		all.size
  	end

  	# Gets latest shows that have already happened
  	def self.latest_shows(number_of_shows = nil)
  		where("date < ?", Date.current).order(date: :desc).limit(number_of_shows)
  	end

  	# Gets future shows that haven't happened yet sorted by soonest show
  	def self.future_shows(number_of_shows)
  		where("date > ?", Date.current).order(date: :asc).limit(number_of_shows)
  	end

  	# Formats the shows date 
  	def formatted_date 
  		date.strftime("%A, %B %d @ 22:00")
  	end
end
