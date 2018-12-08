class Cli
  attr_accessor :user_name, :language, :category, :words_array, :number_of_words
  def start
    self.greeting
  end

  def greeting
    puts "*" *67
    puts ""
    puts "Welcome to LangMe. What is your name?"
    puts ""
    puts "*" *67
    self.quit_text
    self.user_name = gets.chomp.downcase
    return self.quit if self.user_name == "quit"
    puts "-" *67
    puts "Thank you, #{self.user_name.capitalize}."
    puts "-" *67
    puts ""
    self.choose_language
  end

  def choose_language
    puts "*" *67
    puts ""
    puts "What language would you like to learn today?"
    puts ""
    puts "*" *67
    puts ""
    puts "1. Arabic"
    puts "2. French"
    puts "3. Russian"
    puts ""
    self.language = gets.chomp
    return self.quit if self.language == "quit"
    if self.chosen_language_name == self.try_again
      return self.choose_language
    end
    puts ""
    puts "-" *67
    puts "Great choice! Let's start learning #{self.chosen_language_name}."
    puts "-" *67
    puts ""
    self.choose_category
  end

  def choose_category
    puts "*" *67
    puts ""
    puts "What category of words would you like to practice today?"
    puts ""
    puts "*" *67
    puts ""
    puts "1. Foods"
    puts "2. Greetings"
    puts "3. Directions"
    puts "4. Politeness"
    puts "5. Family"
    puts ""
    self.category = gets.chomp
    return self.quit if self.category == "quit"
    if self.chosen_category_name == nil
      return self.choose_category
    end
    puts ""
    puts "-" *67
    puts "Awesome! #{self.chosen_category_name} it is!"
    puts "-" *67
    puts ""
    self.how_many_words
    puts ""
    puts "*" *67
    self.get_random_words
    self.flash_cards


    # self.get_random_words.each {|word| puts word}
  end

  def chosen_language_name
    case self.language
    when "1"
      "Arabic"
    when "2"
      "French"
    when "3"
      "Russian"
    when "quit"
      self.quit
    else
      self.try_again
    end
  end

  def chosen_category_name
    case self.category
    when "1"
      "Foods"
    when "2"
      "Greetings"
    when "3"
      "Directions"
    when "4"
      "Politeness"
    when "5"
      "Family"
    when "quit"
      self.quit
    else
      self.try_again
    end
  end


  #find all translation rows from the table
  #ittarate through the rows and save as a pair english_word => chosen_language_translation
  def get_all_category_words
    rows = Category.find_by(name: self.chosen_category_name).translations
    rows.map {|row| "#{row.english} => #{row.send(self.chosen_language_name.downcase)}"}
  end

  def get_random_words
    self.words_array = self.get_all_category_words.shuffle.first(self.number_of_words.to_i)
  end

  def flash_cards
    i = 0
    while i < self.words_array.length
      # binding.pry
      puts "-" *54
      puts "We are about to start. Please enter a letter to start:"
      puts ""
      puts "| 'n' for next || 'p' for previous || 'quit' to exit |"
      puts "-" *54
      puts ""
      user_input = gets.chomp.downcase
      return self.quit if user_input == "quit"
      if user_input == "p" && i == 0
        # binding.pry
        puts "You did not get any words yet."
        puts ""
        puts "Please type 'n' to start."
        puts ""
        # puts self.words_array[0]
        # puts ""
      elsif user_input == "n"
        puts ""
        puts "-" *35
        puts self.words_array[i]
        i += 1
        puts "-" *35
        if i == self.words_array.length
          puts "*" *67
          puts ""
          puts "This is the end of list."
          puts ""
          self.new_path
        end
      elsif user_input ==  "p"
        puts ""
        i -= 1
        puts "-" *35
        puts self.words_array[i]
        puts "-" *35
      else
        self.try_again
      end
    end
  end

  def how_many_words
    puts "*" *67
    puts ""
    puts "How many words would you like to learn today?"
    puts ""
    puts ""
    puts "*" *67
    puts ""
    self.number_of_words = gets.chomp.slice(0..10)
    return self.quit if self.number_of_words == "quit"
    # binding.pry
    if self.number_of_words.scan(/\D/).empty?
      # binding.pry
      if self.number_of_words.to_i > self.max_words_amount
      puts ""
      puts "That is too many words for today. Let us start with #{self.max_words_amount} words."
      puts ""
      end
    else
      puts ""
      puts "Please enter numbers only"
      puts ""
      self.how_many_words
    end
  end

  def max_words_amount
    # binding.pry
    # binding.pry
    Category.find_by(name: self.chosen_category_name).translations.length
  end

  def new_path
    puts "*" *67
    puts ""
    puts "What would you like to do next?"
    puts ""
    puts "*" *67
    puts ""
    puts "1. Choose new language"
    puts "2. Choose new category"
    puts "3. Review current words"
    puts "4. Quit"
    puts ""
    input = gets.chomp
    puts ""
    case input
    when "1"
      self.choose_language
    when "2"
      self.choose_category
    when "3"
      self.flash_cards
    when "4"
      self.quit
    when "quit"
      self.quit
    else
      self.try_again
      self.new_path
    end
  end

  def try_again
    puts ""
    puts "It seems it was not an option. Plese try it again!"
    puts ""
  end

  def quit_text
    puts ""
    puts "You can type 'quit' at any time to exit the program."
    puts ""
    puts "Please use numbers to navigate."
    puts ""
  end

  def quit
    language_quotes = ["You can never understand one language until you understand at least two.","To have another language is to possess a second soul. -Charlemagne","A different language is a different vision of life.","Language is the road map of a culture. It tells you where its people come from and where they are going."]
    puts "*" *67
    puts ""
    puts language_quotes.sample
    puts ""
    puts "*" *67
    puts ""
    puts "Good bye!"
    puts ""
  end













  # def all_together
  #   puts "Welcome to PROGRAM_NAME. What is your name?"
  #   name = self.input
  #   puts "Thank you, #{name.capitalize}. What language would you like to learn today?"
  #   language_choice = self.input
  #   puts "Great! #{language_choice.capitalize} it is!"
  #   puts "What category would you like to practice today?"
  #   category_choice = self.input.capitalize.pluralize
  #   puts "Great choice! Here are your words."
  #
  #   category_choice_id = Category.where(name: category_choice).pluck(:id).first
  #
  #   translation_choice_id = CategoriesTranslation.where(category_id: category_choice_id).pluck(:translation_id)
  #
  #   translation_row = Translation.where(id: translation_choice_id)
  #
  #   rand_arr = translation_row.shuffle.first(3)
  #
  #   # binding.pry
  #
  #   rand_arr.collect do |row|
  #     puts "#{row.english} => #{row.send(language_choice)}"
  #   end


    # binding.pry
    # puts translation_row.language_choice

  # end


end

# binding.pry
