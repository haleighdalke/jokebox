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
    puts "...and now your age (don't lie):"
    age = gets.chomp
    puts "Lastly let's get your current location:"
    location = gets.chomp
    @current_user = User.new(name: name, age: age, location: location) # *** double check int doesnt throw error ***
    @current_user.save
    puts "Yay! Let's get you started #{name} from #{location} who's definitely not #{age}!"

    #---------welcome loop-------------
    # *** double check that input doesn't throw an error if it can't convernt to Integer ***
    input = 0
    until input.to_i == 6 do
      input = print_main_menu
      input = input.to_i
      if (1..5).include?(input)
        execute_main_menu(input) 
      elsif input == 6
        puts "Goodbye!"
      else
        puts "Invalid command. Please try again."
      end
    end  
  end

  def print_main_menu
    puts "Please choose an option:"
    puts "1. Create a joke"
    puts "2. Edit a joke"
    puts "3. Get all jokes"
    puts "4. Get 'Joke of the Day'"
    puts "5. Delete Joke"
    puts "6. Quit"
    input = gets.chomp
  end

  def execute_main_menu(input)
    case input

    when 1  # create a joke
      @current_user.create_joke
    when 2  # edit a joke (use helper method)
      joke = search_for_joke
      if joke
        @current_user.edit_joke(joke)
      else
        puts "Sorry, joke not found. Please try again."
      end
    
    when 3  # get all jokes *** format better
      Joke.print_all_jokes
    when 4  # get 'joke of the day'
      Joke.joke_of_the_day
    when 5  # delete joke

    else
      puts "Invalid command. Please try again"

    end
  end

  def search_for_joke
    puts "Please enter the whole joke you're looking for: "
    joke = gets.chomp
    Joke.find_by(joke: joke)
  end

end