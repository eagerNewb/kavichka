class Webpage < ActiveRecord::Base
	belongs_to :category
	belongs_to :user

	# Favorited by users
	has_many :favs # just the 'relationships'
	has_many :favorited_by, through: :favs, source: :user 
end
