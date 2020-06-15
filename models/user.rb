class User < ActiveRecord::Base
    has_many :jokes
    has_many :ratings

    def create_joke(joke, topic)
        # prompt user for a joke
        # send joke back, ask if they want to make changes or save?
        # if make changes, repeat joke asking process
        # else save
        # display 'thanks!'
        # return to main title
    end

    def edit_joke(joke)
        # find joke
        # if there, replace it with new
            # prompt use for new joke
            # ask to make changes or save?
            # if changes, repeat joke and ask for process
            # else save
            # return to main menu
        # else "cannot find joke"
            # return to main menu
    end

    def get_all_jokes
        #jokes.all where user == self
    end

    def delete_joke(joke)
        # find joke
        # if there
            # prompt to delete joke
            # if yes, delete
            # else return to main menu
        # else "cannot find joke"
            # return to main menu
    end
end