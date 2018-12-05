class Cli
  attr_accessor :area, :eventtype, :time, :museum, :events

  @@all = []

  def self.all
    @@all
  end

  def welcome
      puts "Welcome to the DC Event Locator."
  end

  def area_prompt
    puts "Please choose an area from the following option for event listings:"
    puts "1. Mall North"
    puts "2. Mall South"
    puts "3. Capitol Hill"
    puts "4. Chinatown"
    puts "5. Foggy Bottom"
      self.area = gets.strip
  end

  def area_selection
    case self.area
    when "1"
      puts "You've selected MALL NORTH"
    when "2"
      puts "You've selected MALL SOUTH"
    when "3"
      puts "You've selected CAPITOL HILL"
    when "4"
      puts "You've selected CHINATOWN"
    when "5"
      puts "You've selected FOGGY BOTTOM"
    else
      puts "Invalid selection."
      self.area_prompt
    end
  end


  def eventtype_prompt
    puts "What kind of event are you interested in today?"
    puts "Please select from:"
    puts "1. Museum"
    puts "2. Lecture"
    puts "3. Concert"
    puts "4. Special Exhibition"
      self.eventtype = gets.strip
  end

  def eventtype_selection
    case self.eventtype
    when "1"
      puts "You've selected MUSEUM"
    when "2"
      puts "You've selected LECTURE"
    when "3"
      puts "You've selected CONCERT"
    when "4"
      puts "You've selected SPECIAL EXHIBITION"
    else
      puts "Invalid selection."
      self.eventtype_prompt
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

def self.call
