class CLI 
  
  # welcome user, get user information, store user information, go to option screen
  def welcome_title
    print_welcome_slogan
    login
    menu_loop
  end

  def print_welcome_slogan
    puts "-----------------------------------"
    puts "
    ░░░░░██╗░█████╗░██╗░░██╗███████╗██████╗░░█████╗░██╗░░██╗
    ░░░░░██║██╔══██╗██║░██╔╝██╔════╝██╔══██╗██╔══██╗╚██╗██╔╝
    ░░░░░██║██║░░██║█████═╝░█████╗░░██████╦╝██║░░██║░╚███╔╝░
    ██╗░░██║██║░░██║██╔═██╗░██╔══╝░░██╔══██╗██║░░██║░██╔██╗░
    ╚█████╔╝╚█████╔╝██║░╚██╗███████╗██████╦╝╚█████╔╝██╔╝╚██╗
    ░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░░╚════╝░╚═╝░░╚═╝\n\n\n"
    puts "Welcome to JokeBox! The super-fun CLI app experience where you can write, rate, and discover quick laughs. \n\n~ we see you smiling already ~\n\n"
    puts "-----------------------------------"

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
    until input.to_i == 6 do
      input = print_main_menu
      input = input.to_i
      if input == 2
        discover_jokes_menu_loop
      elsif (1..5).include?(input)
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
    puts "But first lets get through this crud..."
    puts "-----------------------------------"
    puts " | Please choose an option:      |"
    puts " |                               |"
    puts " | 1. Create a joke              |"
    puts " | 2. Discover jokes             |"
    puts " | 3. Edit your jokes            |"
    puts " | 4. Delete a joke              |"
    puts " | 5. Rate a Random Joke         |"
    puts " | 6. Quit                       |"
    puts "-----------------------------------"
    input = gets.chomp
  end

  # executes the main menu using class functions
  def execute_main_menu(input)
    case input
    when 1                                        # create a joke
      @current_user.create_joke
    # when 2                                        # discover jokes
    #   discover_jokes_menu_loop
    when 3                                        # edit your jokes
      @current_user.edit_joke
    when 4                                        # delete a joke
      @current_user.delete_joke
    when 5                                        # rate a random joke
      @current_user.rate_a_random_joke
    else
      puts "Invalid command. Please try again.\n\n"
    end
  end

  def discover_jokes_menu
    puts "Did you find what you're looking for?"
    puts "-----------------------------------"
    puts " | Please choose an option:      |"
    puts " |                               |"
    puts " | 1. Find jokes by a user       |"
    puts " | 2. Find jokes by a topic      |"
    puts " | 3. Get a random joke          |"
    puts " | 4. Get top 5 rated jokes      |"
    puts " | 5. Get all jokes              |"
    puts " | 6. Return to previous menu    |"
    puts "-----------------------------------"
    input = gets.chomp
  end

  def discover_jokes_menu_loop
    input = 0
    until input.to_i == 6 do
      input = discover_jokes_menu
      input = input.to_i
      if (1..5).include?(input)
        execute_discover_jokes_menu(input) 
      elsif input == 6
        break
      else
        puts "Invalid command. Please try again.\n\n"
      end
    end  
  end

  def execute_discover_jokes_menu(input)
    case input
    when 1                                        # find jokes by a user
      Joke.find_jokes_by_user
    when 2                                        # find jokes by a topic
      Joke.find_jokes_by_topic
    when 3                                        # get a random joke
      Joke.get_random_joke
    when 4                                        # get top 5 rated jokes
      Joke.top_five_rated_jokes
    when 5                                        # get all jokes
      Joke.print_all_jokes
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