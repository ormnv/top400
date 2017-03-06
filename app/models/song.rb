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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

 # show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ApplicationRecord
	has_many  :show_songs
	has_many  :shows, through: :show_songs
	has_many  :djs, through: :dj_shows
	has_many  :track_orders, through: :show_songs

	validates :artist, presence: true
	validates :title, presence: true


	# Sort all songs by the number of shows they have appeared in and the last time they were played
	def self.sort_by_play_count(number_of_songs = nil)
		# debugger
		sorted_songs = Song.all.order(play_count: :desc, updated_at: :asc)[0..number_of_songs]
	end

	def self.play_count_for_song(artist, title)
		Song.where(artist: artist).where(title: title).play_count
	end

	def self.process_song(row, show_id)
		title_row = row["Track Title"].present? ? row["Track Title"] : row["Title"]
    	song = Song.where(artist: row["Artist"]).where(title: title_row).first
    	unless song 
      		# validations needed for artist, title, and album being blank
      		song = Song.create!(artist: row["Artist"], title: title_row, album: row["Album"], bpm: row["BPM"], key: row["Key"])
    	end
    	song.increment!(:play_count)
    	dj_name = row["DJ"].present? ? row["DJ"] : "Olga"
    	dj = Dj.where(name: dj_name).first_or_create
    	ShowSong.create!(song_id: song.id, dj_id: dj.id, show_id: show_id, track_order: row["#"])
	end

	# def track_order(show)
	# 	show_songs.where(show_id: show.id).track_order
	# end
	# def play_count_for_song
	# 	play_count
	# end
end
