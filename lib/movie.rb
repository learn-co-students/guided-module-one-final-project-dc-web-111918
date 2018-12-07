require 'active_record'
class Movie < ActiveRecord::Base
  has_many :watchedmovies
  has_many :users, through: :watchedmovies

end
