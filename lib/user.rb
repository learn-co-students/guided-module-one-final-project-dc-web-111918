require 'active_record'
class User < ActiveRecord::Base
  has_many :watchedmovies
  has_many :movies, through: :watchedmovies

  def retrieve
    get_movie_id = Watchedmovies.all.find_all {|movie| movie.user_id == self.id}

    get_movie_id.each do |x|
      if x.movie_id == nil
        get_movie_id.delete(x)
      end
    end

    get_movie_id.each do |x|
      puts Movie.all.select {|y| y.id == x.movie_id}[0].title
    end
  end #retrieve end
end #class end
