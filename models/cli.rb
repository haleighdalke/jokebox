class CLI 
  
  def welcome_title
    # welcome user
    # get user information
    # store user information
    # go to option screen
    #---------initial welcome----------
    puts "Welcome to JokeBox! The super-fun CLI app experience where you can write, rate, and discover quick laughs. \n\n~we see you smiling already~"
    puts "To start, we need your name: "
    name = gets.chomp
    puts "...and now your age (don't lie)"
    age = gets.chomp
    puts "You lied, but it's okay. Let's get you started #{name}!"
    # create a user
    
    #---------welcome loop-------------
    # *** double check that input doesn't throw an error if it can't convernt to Integer ***
    input = 0
    until input.to_i == 6 do
      input = print_main_menu
      if (1..5).include?(input.to_i)
        execute_main_menu(input) 
      elsif input.to_i == 6
        puts "Goodbye!"
      else
        puts "Invalid command. Please try again."
      end
    end

    #----------goodbye-------------------
  
  end

  def print_main_menu
    puts "1. Create a joke"
    puts "2. Edit a joke"
    puts "3. Get all jokes"
    puts "4. Get 'Joke of the Day'"
    puts "5. Delete Joke"
    puts "6. Quit"
    # Please choose an option: 
    # (1) create a joke, 
    # (2) edit a joke, 
    # (3) get all jokes, 
    # (4) get "joke of the day" (rand joke), 
    # (5) delete joke
    # (6) quit
    # return command
    input = gets.chomp
  end

  def execute_main_menu(input)
  end

end