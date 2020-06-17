class CLI 

  # ----- MAIN FUNCTIONS -----

  # welcome user, get user information, store user information, go to option screen
  def welcome_title
    print_welcome_slogan
    login
    menu_loop
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
        puts "Invalid command. Please try again.\n\n"
      end 
    end 
  end

  # prompt for inupt based on a question (helps with consistent formatting)
  def self.prompt(question=nil)
    if question
      puts question
    end
    print "--> "
    input = gets.chomp
    puts "\n"
    input
  end


  # ----- MENU LOOPS -----

  # menu loop - continue offering menu and executing until user decides to quit
  def menu_loop
    input = 0
    until input == 6 do
      print_main_menu
      input = CLI.prompt.to_i

      if input == 2
        discover_jokes_menu_loop
      elsif (1..5).include?(input)
        execute_main_menu(input) 
      elsif input == 6
        puts "Goodbye!"
      else
        puts "Invalid command. Please try again.\n\n"
      end

    end  
  end

  # discover jokes loop
  def discover_jokes_menu_loop
    input = 0
    until input == 6 do
      print_discover_jokes_menu
      input = CLI.prompt.to_i

      if (1..5).include?(input)
        execute_discover_jokes_menu(input) 
      elsif input == 6
        break
      else
        puts "Invalid command. Please try again.\n\n"
      end

    end  
  end

  # ----- EXECUTIONS -----

  # executes the main menu using class functions
  def execute_main_menu(input)
    case input
    when 1                                        # create a joke
      @current_user.create_joke
    when 2                                        # discover jokes
      discover_jokes_menu_loop
    when 3                                        # edit your jokes
      @current_user.edit_joke
    when 4                                        # delete a joke
      @current_user.delete_joke
    when 5                                        # rate a random joke
      @current_user.rate_a_random_joke
    end
  end

  # executes the discover jokes menu using class functions
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
    end
  end


  # ----- PRINTS -----

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

  def print_main_menu
    puts "\n"
    puts "====================================="
    puts " ||        ~ Main Menu ~          ||"
    puts " ||                               ||"
    puts " || Please choose an option:      ||"
    puts " ||  1. Create a joke             ||"
    puts " ||  2. Discover jokes            ||"
    puts " ||  3. Edit your jokes           ||"
    puts " ||  4. Delete a joke             ||"
    puts " ||  5. Rate a Random Joke        ||"
    puts " ||  6. Quit                      ||"
    puts "====================================="
  end

  def print_discover_jokes_menu
    # puts "Did you find what you're looking for?"
    puts "\n"
    puts "-------------------------------------"
    puts "  |   ~ Discover Jokes Menu ~     |"
    puts "  |                               |"
    puts "  | Please choose an option:      |"
    puts "  |  1. Find jokes by a user      |"
    puts "  |  2. Find jokes by a topic     |"
    puts "  |  3. Get a random joke         |"
    puts "  |  4. Get top 5 rated jokes     |"
    puts "  |  5. Get all jokes             |"
    puts "  |  6. Return to 'Main Menu'     |"
    puts "-------------------------------------"
  end

end