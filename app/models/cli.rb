class Cli
  attr_accessor :museum, :events

  def call
    self.welcome
  end

  def welcome
    puts "Welcome to the DC Event Locator."
    puts "Please select an area for a list of events."
    puts "You may currently choose from:"
    puts "Smithsonian East"
    puts "Smithsonian West"
    puts "Capitol Hill"
    puts "Chinatown"
    puts "Foggy Bottom"

##logic
    self.event_type
  end

  def event_type

    puts "What kind of event are you interested in today?"
    puts "Please select from:"
    puts "Museum"
    puts "Lecture"
    puts "Concert"
    puts "Special Exhibition"

    ##logic
    self.how_much_time
  end

  def how_much_time
    puts "How much time do you have?"
    puts "Please enter number of minutes"

    self.list_events
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
    puts "Event Start: "
  # EVENT DETAILS
  #
    puts "Press 'B' to go back to list"
    puts "Press 'N' to search again"
    puts "Press 'Q' to quit"
  end

end
