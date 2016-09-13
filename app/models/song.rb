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
#  show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Song < ApplicationRecord
	belongs_to  :show
	has_many 	:djs, through: :show
end
