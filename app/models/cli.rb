class Cli
  attr_accessor :area_input, :area, :eventtype_input, :eventtype, :availabletime_input,
  :availabletime, :selectedevent,:time, :museum, :events, :event_list, :selectoption, :nextoption

  @@all = []

  def self.all
    @@all
  end

  def welcome
      puts "Welcome to the DC Event Locator."
      puts ""
      self.area_prompt
  end

  def area_prompt
    puts "Please choose an area from the following option for event listings:"
    puts "1. Mall North"
    puts "2. Mall South"
    puts "3. Capitol Hill"
    puts "4. Chinatown"
    puts "5. Foggy Bottom"
    self.area_input = STDIN.gets.strip
    self.area_valid?
  end

  def area_valid?
    self.area_prompt
    if self.area_input.to_i.between?(1,5)
      self.area_selection
    else
      puts "Invalid selection."
      self.area_prompt
    end
  end

  def area_selection
    case self.area_input
    when "1"
      puts "You've selected MALL NORTH"
      self.area = Neighborhood.find_by(name: "Mall North")
    when "2"
      puts "You've selected MALL SOUTH"
      self.area = Neighborhood.find_by(name: "Mall South")
    when "3"
      puts "You've selected CAPITOL HILL"
      self.area = Neighborhood.find_by(name: "Capitol Hill")
    when "4"
      puts "You've selected CHINATOWN"
      self.area = Neighborhood.find_by(name: "Chinatown")
    when "5"
      puts "You've selected FOGGY BOTTOM"
      self.area = Neighborhood.find_by(name: "Foggy Bottom")
    end
      self.eventtype_prompt
  end

  def eventtype_prompt
    puts "What kind of event are you interested in today?"
    puts "Please select from:"
    puts "1. Museum"
    puts "2. Lecture"
    puts "3. Concert"
    puts "4. Special Exhibition"
    puts ""
    puts "Enter 'B' to go back"
      self.eventtype_input = STDIN.gets.strip
      self.eventtype_valid?
  end

  def eventtype_valid?
    if self.eventtype_input.to_i.between?(1,5)
      self.eventtype_selection
    elsif self.eventtype_input == "B"
      self.area_prompt
    else puts "Invalid selection."
      self.eventtype_prompt
    end
  end

  def eventtype_selection
    case self.eventtype_input
    when "1"
      puts "You've selected MUSEUM"
      self.eventtype = "Museum"
    when "2"
      puts "You've selected LECTURE"
      self.eventtype = "Lecture"
    when "3"
      puts "You've selected CONCERT"
      self.eventtype = "Concert"
    when "4"
      puts "You've selected SPECIAL EXHIBITION"
      self.eventtype = "Special Exhibition"
    end
    self.availabletime_prompt
  end

  def availabletime_prompt
    puts "How much time do you have?" #### if we have time make it deal with hours/minutes. break it down?
    puts "1. 30 Minutes"
    puts "2. 1 hour"
    puts "3. 2 hours"
    puts "4. More than 2 hours"
    puts ""
    puts "Enter 'B' to go back"
      self.availabletime = STDIN.gets.strip
  end

  def availabletime_valid?
    if self.availabletime_input.to_i.between?(1,5)
      self.availabletime_selection
    elsif self.availabletime_input == "B"
      self.events_picker
    else puts "Invalid selection."
      self.availabletime_prompt
    end
  end

  def availabletime_selection
    case self.availabletime
    when "1"
      puts "You've selected 30 minutes"
      self.availabletime = 30
    when "2"
      puts "You've selected 1 hour"
      self.availabletime = 60
    when "3"
      puts "You've selected 2 hours"
      self.availabletime = 120
    when "4"
      puts "More than 2 hours"
      self.availabletime = 121
    when "B"
      self.eventtype_prompt
    end
    self.event_picker
  end

  def events_picker
    self.event_list = []
    d = DateTime.now
    #d = d.strftime("%d/%m/%Y %H:%M")  ###implement me when we start using dates and not just times
    d = d.strftime("%H:%M").tr(':','.date')
    if Event.where(eventtype: eventtype, neighborhood_id: area.id) == []
      puts ""
      puts ""
      puts "Sorry, there are no events matching your criteria, please search."
      puts ""
      puts ""
      Cli.new.call
    else
      Event.where(eventtype: eventtype, neighborhood_id: area.id).select do |evnt|
        date_now = d.split(':')[0].to_i + (d.split(':')[1].to_i * 1.0)/60 ###########time is hard to add. . .convert to integer
        date_open = evnt.date_time.strftime("%H:%M").split(':')[0].to_i + (evnt.date_time.strftime("%H:%M").split(':')[1].to_i * 1.0)/60
        date_close = (evnt.duration * 1.0)/60 + date_open
        if eventtype == "Special Event" && ((date_now > date_open) && (date_now < date_close - 0.5)) #make sure you can see 30 min
            self.event_list << evnt
        elsif eventtype == "Lecture" || "Concert" && ((date_now > date_open - 0.5 ) && (date_now < date_close - 0.5)) #make sure you can see the entire thing and have time to get there
            self.event_list << evnt
        else
          if (date_now > date_open) && (date_now < date_close - 0.5) #eventtype == "Museum"  #just fit in the duration
            self.event_list << evnt
          end
        end
      end
    end
  end


  def listevents_prompt
    # binding.pry

      #940 lecture at the blah
      if self.event_list == []
        puts ""
        puts ""
        puts "Sorry, there are no events matching your criteria, please search."
        puts ""
        puts ""
        Cli.new.call
      else
    puts "Please select the event you're interested in to see more details."
    puts ""
    puts "1. #{ self.event_list[0].name} - #{self.event_list[0].name.strftime("%d/%m/%Y %H:%M")} #{ self.event_list[0].eventtype} at the #{Museum.find_by(id: self.event_list[0].museum_id).name}"
    puts "2. #{ self.event_list[1].name} - #{self.event_list[1].name.strftime("%d/%m/%Y %H:%M")} #{ self.event_list[1].eventtype} at the #{Museum.find_by(id: self.event_list[1].museum_id).name}"
    puts "3. #{ self.event_list[2].name} - #{self.event_list[2].name.strftime("%d/%m/%Y %H:%M")} #{ self.event_list[2].eventtype} at the #{Museum.find_by(id: self.event_list[2].museum_id).name}"
      self.selectedevent = STDIN.gets.strip
    end
  end

  def selectedevent_valid?
    if self.selectedevent.to_i.between?(1,self.event_list.length)
      self.listevents_selection
    elsif self.listevents_input == "B"
      self.events_picker
    else puts "Invalid selection."
      self.listevents_prompt
    end
  end


  def listevents_selection
    # event = self.event_list[self.selectedevent-1]
    event = Event.find_by(name:"Special Exhibition1")
    time = event.date_time
    puts "#{event.name.upcase} at the #{event.museum.name.upcase}"
    puts "Date: #{time.strftime('%A')}, #{time.strftime('%B')} #{time.strftime('%d')}, #{time.year}"
    puts "Time: #{time.strftime('%-l:%M %p')}"
    puts "Duration: #{event.duration} minutes"
    puts "Details: #{event.description}"

    puts "1. Go back to list"
    puts "2. New Search"
    puts "3. Exit"
    self.nextoption = STDIN.gets.strip
    self.nextoption_valid?
  end

  def nextoption_valid?
    case self.nextoption
    when "1"
      self.listevents_prompt
    when "2"
      self.area_prompt
    when "3"
      self.quit
    else
      puts "Invalid selection"
      self.eventdetails_prompt
    end
  end

  def quit
    puts "Thank you for using the DC Event Locator come again!"
  end

   def call
    self.welcome
   end

end
