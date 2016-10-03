# == Schema Information
#
# Table name: shows
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  date        :date
#  file        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Show < ApplicationRecord
	has_many :dj_shows
	has_many :show_songs
	has_many :songs, through: :show_songs
	has_many :djs, through: :dj_shows

	validates :title, presence: true
	validates :djs, presence: true
	validates :date, presence: true
	validates :description, presence: true

	def djNames
		djs.pluck(:name).join(' , ')
	end
end
