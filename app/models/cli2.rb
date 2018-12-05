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
    when 1
      puts "You've selected MALL NORTH"
    when 2
      puts "You've selected MALL SOUTH"
    when 3
      puts "You've selected CAPITOL HILL"
    when 4
      puts "You've selected CHINATOWN"
    when 5
      puts "You've selected FOGGY BOTTOM"
    else
      puts "Invalid option"
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
    # if self.eventtype == 1
    #   puts "You've selected "
  end

end

this_session = Cli.new
this_session.welcome
this_session.area_prompt
this_session.area_selection
# puts "session area is:  #{this_session.area}"
this_session.eventtype_prompt
puts "session prompt is : #{this_session.eventtype}"
