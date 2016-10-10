# == Schema Information
#
# Table name: dj_shows
#
#  id         :integer          not null, primary key
#  dj_id      :integer
#  show_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DjShow < ApplicationRecord
	belongs_to :dj
	belongs_to :show
end
