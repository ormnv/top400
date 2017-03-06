# == Schema Information
#
# Table name: shows
#
#  id                    :integer          not null, primary key
#  title                 :string(255)
#  date                  :date
#  image                 :string(255)
#  tracklist             :string(255)
#  link_to_soundcloud    :string(255)
#  link_to_newtown_radio :string(255)
#  description           :text(65535)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'csv'

class Show < ApplicationRecord
	has_many :show_songs
	has_many :songs, through: :show_songs
	has_many :djs, through: :show_songs
	accepts_nested_attributes_for :djs, :reject_if => lambda { |dj| dj[:name].blank? }
	accepts_nested_attributes_for :songs

	# validates :title, presence: true
	# validates :date, presence: true
	# validates :flyer, presence: true, :unless => lambda { self.is_standalone = 1 }
	# validates :tracklist, presence: true, :if => lambda { self.is_standalone = 1 }

	# uncomment
	# validates :link_to_newtown_radio, presence: true

	has_attached_file :flyer, styles: { full: "1080x1080", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :flyer, content_type: /\Aimage\/.*\z/

	scope :not_standalone, -> { where(is_standalone: false) }
	scope :standalone, -> { where(is_standalone: true) }

	def djs 
		show_songs.map(&:dj).uniq
	end

	def djNames
		djs.pluck(:name).join(' , ')
	end

  def process_song(row)
    Song.process_song(row, id)
  end

  # Gets count of all shows 
	def self.number_of_shows
		not_standalone.all.size
	end

	# Gets latest shows that have already happened
	def self.latest_shows(number_of_shows = nil)
		not_standalone.where("date < ?", Date.current).order(date: :desc).limit(number_of_shows)
	end

	# Gets future shows that haven't happened yet sorted by soonest show
	def self.future_shows(number_of_shows)
		not_standalone.where("date >= ?", Date.current).order(date: :asc).limit(number_of_shows)
	end

	# Orders songs by track order for show 
	def songs_in_order
		show_songs.order(:track_order).map {|show_song| show_song.song }
	end

	def has_tracklist?
		tracklist.present?
	end

	def is_standalone?
		is_standalone == true
	end

	# Formats the shows date 
	def formatted_date 
		date.strftime("%A, %B %d @ 22:00")
	end
end
