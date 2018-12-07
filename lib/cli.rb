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

  end
end
