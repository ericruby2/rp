class Moviegoer < ActiveRecord::Base
  acts_as_canhaz_subject
	has_many :reviews
  attr_accessible :name, :provider, :uid
  def self.create_with_omniauth(auth)
# 	debugger
  	Moviegoer.create!(
  		:provider => auth["provider"],
  		:uid =>auth["uid"],
  		:name => auth["info"]["name"])
  end
  has_many :reviews
  has_many :movies, :through => :reviews
end
