# == Schema Information
#
# Table name: show_songs
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShowSong < ApplicationRecord
	belongs_to :song
	belongs_to :show
end
