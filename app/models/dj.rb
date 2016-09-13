class Dj < ApplicationRecord
	has_many :show
	has_many :songs, through: :show
end
