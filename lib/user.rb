require 'active_record'
class User < ActiveRecord::Base
  has_many :watchedmovies
  has_many :movies, through: :watchedmovies


end
