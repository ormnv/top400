# == Schema Information
#
# Table name: djs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  string     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dj < ApplicationRecord
	has_many :dj_shows
	# has_many :songs, through: :shows
	has_many :shows, through: :dj_shows
	# has_many :songs, through: :show_songs
	validates :name, presence: true
end
