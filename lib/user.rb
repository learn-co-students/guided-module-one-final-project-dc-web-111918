require 'active_record'
class User < ActiveRecord::Base
  has_many :watchedmovies
  has_many :movies, through: :watchedmovies

  def retrieve
    get_movie_id = Watchedmovies.all.find_all {|movie| movie.user_id == self.id}
        hopefully_found = Movie.all.select {|x| x.id == get_movie_id[0].movie_id}
        puts hopefully_found[0].title
        # binding.pry
  end


end
