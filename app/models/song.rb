# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  artist     :string(255)
#  title      :string(255)
#  album      :string(255)
#  bpm        :decimal(10, )
#  key        :string(255)
#  order      :integer
#  show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

 # show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ApplicationRecord
	# has_many  :show_songs
	belongs_to  :show
	# has_one	 :dj, through: :show
	# has_many  :djs, through: :dj_shows

	# Sort all songs by the number of shows they have appeared in 
	def self.sort_by_play_count(number_of_songs = nil)
		# debugger
		# sorted_songs = Song.all.map{ |s| [s, s.play_count_for_song] }.flatten[0..number_of_songs]
		sorted_songs = Song.all.sort_by {|song| song.play_count_for_song }[0..number_of_songs]
	end

	def self.play_count_for_song(artist, title)
		Song.where(artist: artist).where(title: title).size
	end

	def play_count_for_song
		Song.where(artist: artist).where(title: title).size
	end
end
