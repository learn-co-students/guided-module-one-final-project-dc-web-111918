class Cli
  attr_accessor :museum, :events

  def call
    self.welcome
  end

  def self.welcome
      puts "Welcome to the DC Event Locator."
      puts "Please choose an area from the following option for event listings:"
      puts "1. Smithsonian East"
      puts "2. Smithsonian West"
      puts "3. Capitol Hill"
      puts "4. Chinatown"
      puts "5. Foggy Bottom"
  end

  def call_welcome
    self.welcome
    area = gets.chomp
  end

    def event_type

      puts "What kind of event are you interested in today?"
      puts "Please select from:"
      puts "1. Museum"
      puts "2. Lecture"
      puts "3. Concert"
      puts "4. Special Exhibition"
    end

    puts event_type
    event = gets.chomp

    self.how_much_time
  end

  def how_much_time
    puts "How much time do you have?"
    puts "Please enter number of minutes (maximum 480)" #### this might get gnarly with minutes. break it down?

    spare_time = gets.strip
    if (spare_time < 480) ####it's lazy but this will filter strings out as well
      self.list_events
    else
      puts "Sorry that doesn't work."
      self.how_much_time
    end
  end


  def list_events

    puts "Please select the event you're interested in to see more details."
  # 1.
  # 2.
  # 3.
    self.event_details
  end

  def event_details

    puts "EVENT DETAILS:"
      ##PULL EVENT DETAILS FROM DB

    puts "Event Start: "
  # EVENT DETAILS
  #
    puts "Press 'B' to go back to list"
    puts "Press 'N' to search again"
    puts "Press 'Q' to quit"
    whats_next = gets.strip
    if whats_next == "B"
      self.list_events
    elsif whats_next == "N"
      self.welcome
    elsif "Q"
      self.quit
  end

  def quit
    puts "Thank you for using the DC Event Locator come again!"
    exit
  end

end
