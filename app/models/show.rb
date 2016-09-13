# == Schema Information
#
# Table name: shows
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  dj          :string(255)
#  date        :date
#  file        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Show < ApplicationRecord
	has_many :songs, dependent: :destroy
	has_many :djs

	validates :title, presence: true, length: { minimum: 5 }
	validates :dj, presence: true
	validates :description, presence: true
end
