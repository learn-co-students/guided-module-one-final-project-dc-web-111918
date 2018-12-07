require 'active_record'
class Watchedmovies < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
end
