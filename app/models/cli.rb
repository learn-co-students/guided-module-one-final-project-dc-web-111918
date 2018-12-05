class Cli
  attr_accessor :museum, :events, :area, :event_type, :whats_next

  def call
    self.welcome
  end

  def welcome
      puts "Welcome to the DC Event Locator."

  def
      puts "Please choose an area from the following option for event listings:"
      puts "1. Smithsonian East"
      puts "2. Smithsonian West"
      puts "3. Capitol Hill"
      puts "4. Chinatown"
      puts "5. Foggy Bottom"

      area = gets.chomp
      if area == 1
        puts "You've selected Mall North"
      elsif area == 2
        puts "You've selected Mall South"
      elsif area == 3
        puts "You've selected Capitol Hill"
      elsif area == 4
        puts "You've selected Chinatown"
      elsif area == 5
        puts "You've selected Foggy Bottom"
      else
        Please select a valid option from the
        self.welcome
      end
  end

  def event_type

    puts "What kind of event are you interested in today?"
    puts "Please select from:"
    puts "1. Museum"
    puts "2. Lecture"
    puts "3. Concert"
    puts "4. Special Exhibition"

    event_type = gets.chomp
    if event_type == 1
      self.how_much_time
    elsif event_type == 2
      self.how_much_time
    elsif event_type == 3
      self.how_much_time
    elsif event_type == 4
      self.how_much_time
    else
      "That didn't work"
      self.event_type
    end
  end

  def how_much_time
    puts "How much time do you have?"
    puts "Please select an amount of time." #### this might get gnarly with minutes. break it down?

    puts "1. 30 Minutes"
    puts "2. 1 hour"
    puts "3. 2 hours"
    puts "4. More than 2 hours"

    area = gets.chomp
    if area == 1
      self.event_type
    elsif area == 2
      self.event_type
    elsif area == 3
      self.event_type
    elsif area == 4
      self.event_type
    elsif area == 5
      self.event_type
    else
      "That didn't work"
      self.welcome
    end
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

    puts "EVENT DETAILS: "
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
