class Cli
  attr_accessor :area_input, :area, :eventtype_input, :eventtype, :ratings, :users,
  :availabletime, :selectedevent,:time, :museum, :events, :event_list, :selectoption,
  :nextoption, :userqueryprompt_input, :users, :ratings, :createnewuser_input,
  :userlogin_input, :active_user, :createnewuser_input

  @@all = []

  @@all
  def self.all
  end

  def header
    puts "\e[H\e[2J"
    artii = Artii::Base.new()
    puts Rainbow artii.asciify('District Discoverer').bright.cyan
  end

  def welcome
      header
      puts ""
      puts ""
      # puts Rainbow ("DC Neighborhood Events Finder!").bright.underline.blue
      puts ""
      puts ""
      #self.area_prompt
      self.userquery_prompt
  end
#####################user stuff new##################
def userquery_prompt
  puts "Have you used this system before?"
  puts ""
  puts "1. Yes"
  puts "2. No"
  #puts "3. Exit"
  puts ""
  puts ""
    self.userqueryprompt_input = STDIN.gets.strip.downcase
    self.userquery_valid?
end

def userquery_valid?
  if self.userqueryprompt_input.to_i.between?(1,2)
    self.userlogin_selection
  else
    puts "Invalid selection."
    self.userquery_prompt
  end
end

def remove_nonnumerical_char(val)
  return val = val.gsub(/[()-+.]/,'')
end

def userlogin_selection
  self.userqueryprompt_input = remove_nonnumerical_char(self.userqueryprompt_input)
  case self.userqueryprompt_input
  when "1"
    self.userlogin_prompt
  when "2"
    self.createnewuser_prompt
  end
end

###old user login start
def userlogin_prompt
  header
  puts ""
  puts ""
  puts "Please enter your username to login."
  puts ""
    self.userlogin_input = STDIN.gets.strip
    self.userlogin_valid?
end

#
# def area_valid?
#   if self.area_input.to_i.between?(1,Neighborhood.all.length+1)
#     self.area_selection
#   else
#     puts ""
#     puts Rainbow ("Invalid Selection").bright.red
#     puts ""
#     self.area_prompt
#   end
# end

def userlogin_valid?
  if User.find_by(name: userlogin_input) != nil
    if User.find_by(name: userlogin_input).name == self.userlogin_input #########put in custom error catch
      self.active_user = User.find_by(name: userlogin_input) ### if you use this method.name it dies if there isn't a match
      self.welcome_user
    end
  else
    puts ""
    puts ""
    puts Rainbow ("I'm sorry that's not a valid username.").bright.red
    puts ""
    puts "I'll let you try again."
    puts ""
    self.userquery_prompt
  end
end
###old user login end

###new user creation start
def createnewuser_prompt
  header
  puts ""
  puts ""
  puts "Please enter a username."
  puts ""
    self.createnewuser_input = STDIN.gets.strip
    self.createnewuser_valid?
end

def createnewuser_valid?
  self.active_user = User.find_or_create_by(name: self.createnewuser_input)
  self.welcome_user
end
###new user creation end

def welcome_user
  header
  puts ""
  puts ""
  puts "Welcome #{self.active_user.name}, you are now logged in!"
  puts ""
  self.area_prompt
end

#################user stuff END NEW
  def area_prompt
    puts ""
    puts "Please choose an area from the following option for event listings:"
    puts ""
    i = 1
    Neighborhood.all.each do |nbh|
      puts "#{i}. #{nbh.name}"
      i += 1
    end
    self.area_input = STDIN.gets.strip
    self.area_valid?
  end

  def area_valid?
    if self.area_input.to_i.between?(1,Neighborhood.all.length+1)
      self.area_selection
    else
      puts ""
      puts Rainbow ("Invalid Selection").bright.red
      puts ""
      self.area_prompt
    end
  end

  def area_selection
    header
    self.area_input = remove_nonnumerical_char(self.area_input)
    case self.area_input
    when "1"
      puts ""
      puts "You've selected MALL NORTH"
      self.area = Neighborhood.find_by(name: "Mall North")
    when "2"
      puts ""
      puts "You've selected MALL SOUTH"
      self.area = Neighborhood.find_by(name: "Mall South")
    when "3"
      puts ""
      puts "You've selected CAPITOL HILL"
      self.area = Neighborhood.find_by(name: "Capitol Hill")
    when "4"
      puts ""
      puts "You've selected CHINATOWN"
      self.area = Neighborhood.find_by(name: "Chinatown")
    when "5"
      puts ""
      puts "You've selected FOGGY BOTTOM"
      self.area = Neighborhood.find_by(name: "Foggy Bottom")
    end
      self.eventtype_prompt
  end

  def eventtype_prompt
    puts ""
    puts "What kind of event are you interested in today?"
    puts ""
    puts "Please select from:"
    puts ""
    puts "1. Museum"
    puts "2. Lectures and Discussions"
    puts "3. Concert and Performances"
    puts "4. Special Exhibition"
    puts "5. I don't care I just want to see what is available"
    puts ""
    puts "Enter 'B' to go back"
    puts ""
      self.eventtype_input = STDIN.gets.strip
      self.eventtype_valid?
  end

  def eventtype_valid?
    if self.eventtype_input.to_i.between?(1,5)
      self.eventtype_selection
    elsif self.eventtype_input == "B" || self.eventtype_input == "b"
      self.area_prompt
    else puts Rainbow ("I'm sorry that's not a valid username.").bright.red
      self.eventtype_prompt
    end
  end

  def eventtype_selection
    header
    case self.eventtype_input
    when "1"
      puts "You've selected MUSEUM"
      self.eventtype = "Museum"
    when "2"
      puts "You've selected LECTURE AND DISCUSSIONS"
      self.eventtype = "Lecture"
    when "3"
      puts "You've selected CONCERTS AND PERFORMANCES"
      self.eventtype = "Concert"
    when "4"
      puts "You've selected SPECIAL EXHIBITION"
      self.eventtype = "Special Exhibition"
    when "5"
      puts "You've selected Any"
      self.eventtype = "Any Event"
    end
    self.availabletime_prompt
  end

  def availabletime_prompt
    puts ""
    puts "How much time do you have?" #### if we have time make it deal with hours/minutes. break it down?
    puts "1. 30 Minutes"
    puts "2. 1 hour"
    puts "3. 2 hours"
    puts "4. More than 2 hours"
    puts ""
    puts "Enter 'B' to go back"
      self.availabletime = STDIN.gets.strip
      availabletime_valid?
  end

  def availabletime_valid?
    if self.availabletime.to_i.between?(1,4)
      self.availabletime_selection
    elsif self.selectedevent == "B" || self.selectedevent == "b"
      self.events_picker
    else puts Rainbow ("I'm sorry that's not a valid username.").bright.red
      self.availabletime_prompt
    end
  end

  def availabletime_selection
    header
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
    end
    self.events_picker
  end

  def events_picker
    header
    self.event_list = []
    d = DateTime.now # - (8/24.0)
    #d = d.strftime("%d/%m/%Y %H:%M")  ###implement me when we start using dates and not just times
    d = d.strftime("%H:%M").tr(':','.date')
    #binding.pry
    #self.eventtype == "Any Event" ? evnttype = nil : (evnttype = eventtype: self.eventtype)
    search_params = {neighborhood_id: self.area.id}
    search_params[:eventtype] = self.eventtype if self.eventtype != "Any Event"
    if Event.where(search_params) == []
      puts ""
      puts "Sorry #{self.active_user.name}, there are no events matching your criteria, please search again."
      puts ""
      puts ""
      puts ""
      self.area_prompt
    else
      Event.where(search_params).select do |evnt|
        date_now = d.split(':')[0].to_i + (d.split(':')[1].to_i * 1.0)/60 ###########time is annoying to add. . .converted to integer
        date_open = evnt.date_time.strftime("%H:%M").split(':')[0].to_i + (evnt.date_time.strftime("%H:%M").split(':')[1].to_i * 1.0)/60
        date_close = (evnt.duration * 1.0)/60 + date_open
        if (self.eventtype == "Special Event") && ((date_now > date_open) && (date_now < date_close - 0.5) && availabletime < evnt.duration) #make sure you can see 30 min
            self.event_list << evnt
        elsif (self.eventtype == ("Lecture" || "Concert")) && ((date_now > date_open - 0.5 ) && (date_now < date_close - 0.5) && availabletime < evnt.duration) #make sure you can see the entire thing and have time to get there
            self.event_list << evnt
        else
          # binding.pry
          if (date_now > date_open) && (date_now < date_close - 0.5) #eventtype == "Museum"  #just fit in the duration
            self.event_list << evnt
          end
        end
      end
      self.listevents_prompt
    end
  end


  def listevents_prompt
    header
    if self.event_list == [] || self.event_list == nil
      puts ""
      puts "Sorry #{self.active_user.name}, there are no events matching your criteria, please search again."
      puts ""
      puts ""
      self.area_prompt
    else
      puts ""
      puts ""
      puts "Please select the event you're interested in to see more details."
      puts ""
        #940 lecture at the blah
        i = 1
      self.event_list.each do |currevent|
        puts "#{i}. #{currevent.name} - #{currevent.date_time.strftime("%A, %b %d at %I:%M %p")} - #{currevent.eventtype} at the #{Museum.find_by(id: currevent.museum_id).name}"
        i += 1
        # binding.pry
      end
      self.selectedevent = STDIN.gets.strip
      self.selectedevent_valid?
    end
  end

  def selectedevent_valid?
    if self.selectedevent.to_i.between?(1,self.event_list.length)
      self.listevents_selection
    elsif self.selectedevent == "B"
      self.events_picker
    else puts Rainbow ("I'm sorry that's not a valid selection.").bright.red
      self.listevents_prompt
    end
  end


  def listevents_selection
    header
    event = self.event_list[self.selectedevent.to_i-1]
    # event = Event.find_by(name:"Special Exhibition1")
    time = event.date_time
    puts ""
    if event.name.upcase == event.museum.name.upcase
      puts "#{event.name.upcase}"
    else
      puts "#{event.name.upcase} at the #{event.museum.name.upcase}"
    end
    puts ""
    puts "Date: #{time.strftime('%A')}, #{time.strftime('%B')} #{time.strftime('%d')}, #{time.year}"
    puts "Time: #{time.strftime('%-l:%M %p')}"
    hours = event.duration / 60
    rest = event.duration % 60
    puts "Duration: #{hours}:#{rest}"
    puts "Details: #{event.description}"
    puts ""
    puts ""
    puts "1. Go back to list"
    puts "2. New Search"
    puts "3. Exit"
    puts ""
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
      puts Rainbow ("I'm sorry that's not a valid selection.").bright.red
      self.listevents_selection
    end
  end

  def quit
    header
    puts ""
    puts "Thank you #{self.active_user.name} for using the District Discoverer come again!"
    puts ""
  end

end
