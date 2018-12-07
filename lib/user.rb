require 'active_record'
class User < ActiveRecord::Base
  has_many :watched_movies
  has_many :movies, through: :watched_movies


end
