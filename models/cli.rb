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
    input = ""
    until input == "Y" || input == "N" do 
      input = CLI.prompt("Have you used this app before? (Y/N)")
      if input == "Y"
        @current_user = User.log_in
      elsif input == "N"
        @current_user = User.sign_up
      else
        puts "Invalid command. Please try again."
      end 
    end 
  end
   
  # menu loop - continue offering menu and executing until user decides to quit
  def menu_loop
    input = 0
    until input == 7 do
      print_main_menu
      input = CLI.prompt.to_i
      if (1..6).include?(input)
        execute_main_menu(input) 
      elsif input == 7
        puts "Goodbye!"
      else
        puts "Invalid command. Please try again."
      end
    end  
  end

  # prints main menu
  def print_main_menu
    puts "-----------------------------------"
    puts " | Please choose an option:      |"
    puts " |                               |"
    puts " | 1. Create a joke              |"
    puts " | 2. Edit a joke                |"
    puts " | 3. Get all jokes              |"
    puts " | 4. Get 'Joke of the Day'      |"
    puts " | 5. Delete Joke                |"
    puts " | 6. Rate a Random Joke         |"
    puts " | 7. Quit                       |"
    puts "-----------------------------------"
  end

  # prompt for inupt based on a question (helps with consistent formatting)
  def self.prompt(question=nil)
    if question
      puts question
    end
    print "--> "
    gets.chomp
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
    when 6 # rate a joke
      @current_user.rate_a_random_joke
    else
      puts "Invalid command. Please try again"

    end
  end

end