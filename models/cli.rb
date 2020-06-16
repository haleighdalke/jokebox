class CLI 
  
  # welcome user, get user information, store user information, go to option screen
  def welcome_title
    puts "Welcome to JokeBox! The super-fun CLI app experience where you can write, rate, and discover quick laughs. \n\n~we see you smiling already~\n\n"
    login
    menu_loop
  end

  # login function - ask for user input, then sign up or login
  def login
    puts "Have you used this app before? (Y/N)"
    input = ""
    until input == "Y" || input == "N" do 
      input = gets.chomp
      if input == "Y"
        user_log_in
      elsif input == "N"
        user_sign_up
      else
        puts "Invalid command. Please try again."
      end 
    end 
  end
   
  # menu loop - continue offering menu and executing until user decides to quit
  def menu_loop
    input = 0
    until input.to_i == 6 do        # *** double check that input doesn't throw an error if it can't convernt to Integer ***
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

  # prints main menu
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

  # executes the main menu using class functions
  def execute_main_menu(input)
    case input
    when 1                                        # create a joke
      @current_user.create_joke
    when 2                                        # edit a joke (use helper method)
      @current_user.edit_joke
    when 3                                        # get all jokes *** format better
      Joke.print_all_jokes
    when 4                                        # get 'joke of the day'
      Joke.joke_of_the_day
    when 5                                        # delete joke
      @current_user.delete_joke
    else
      puts "Invalid command. Please try again"

    end
  end

  # prompt for new user sign up
  def user_sign_up
    puts "To start, we need your name: "
    name = gets.chomp
    puts "...and now your age (don't lie):"
    age = gets.chomp
    puts "Lastly let's get your current location:"
    location = gets.chomp
    @current_user = User.create(name: name, age: age, location: location) # *** double check int doesnt throw error ***
    puts "Yay! Let's get you started #{name} from #{location} who's definitely not #{age}!"
  end

  # pompt for user name, search for first instance of that name, if name doesn't exit then sign up the user
  def user_log_in
    puts "Great! What is your name?"
    name = gets.chomp
    @current_user = User.all.find_by(name: name)
    if @current_user
      puts "Welcome back, #{@current_user.name}! Let's get you started."
    else 
      puts "Unfortunately, we could not find you in our system. Let's sign you up."
      user_sign_up
    end
  end
end