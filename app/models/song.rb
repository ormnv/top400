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
	# has_many  :djs, through: :dj_shows
end
