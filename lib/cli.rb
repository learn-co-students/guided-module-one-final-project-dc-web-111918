require 'pry'

class CLI
  attr_accessor :runtime

  def call
    self.start
  end #call end

  def start
    puts "       |-----------------------|"
    puts "       |                       |"
    puts "       |      WELCOME TO       |"
    puts "       |    PROCRASTINATION    |"
    puts "       |       NATION!!!       |"
    puts "       |                       |"
    puts "       |                       |"
    puts "       |                       |"
    puts "       |_______________________|"
    puts "Hello! What is your name?"
    puts "(Type 'quit' at any time to exit the application!)"
    user_name = STDIN.gets.strip.capitalize
    quit if user_name.downcase == 'quit'
    current_user = create_user(user_name)
    puts "Hello #{user_name}! How much free time do you have in minutes?"
    free_time = STDIN.gets.strip
      quit if free_time.downcase == 'quit'
    movie = choose_movie(free_time)
    create_watched_movie(current_user, movie)
    puts "Would you like to view your watched history?"
    recall_movies = STDIN.gets.strip
    quit if recall_movies.downcase == "no"
    current_user.retrieve if recall_movies.downcase == "yes"
    # binding.pry
    quit
  end #start end

  def search_for_movie(free_time)
    free_time = free_time.to_i
    if free_time < 90
      puts "No movies for you"
      quit
    else
      desired_movies = Movie.all.select{|movie| movie.runtime <= free_time}
      # binding.pry
    end
    return desired_movies
  end #search_for_movie end

  def choose_movie(free_time)
    available_movies = search_for_movie(free_time)
    puts available_movies[0].title
    puts "How does this sound?"
    puts "Respond with Yes or No"
    response = STDIN.gets.strip.downcase
      quit if response.downcase == 'quit'
    until response.downcase == "yes" || available_movies.length == 1
      available_movies.delete_at(0)
      puts "How about this one?"
      # binding.pry
      puts available_movies[0].title
      response = STDIN.gets.strip.downcase
        quit if response.downcase == 'quit'
      if available_movies.length == 2 && response == "no"
        puts "Ok! One last movie suggestion! Please say yes!"
      end
    end # Ends the UNTIL loop
    if response == "yes"
      puts "Have fun! Don't spoil the ending!:)"
      return available_movies[0]
    else
      puts "You're too picky"
    end
  end

  def create_watched_movie(name, movie)
  Watchedmovies.find_or_create_by(user: name, movie: movie)
end

def create_user(name)
  User.find_or_create_by(name: name)
end

  def quit
    puts "Goodbye!"
    exit
  end #quit end

end #class end
