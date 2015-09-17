class Review < ActiveRecord::Base
	acts_as_canhaz_object
	belongs_to :movie
	belongs_to :moviegoer
	attr_protected :moviegoer_id
	validates :moviegoer_id, presence: true
	validates :movie_id, presence: true
end
