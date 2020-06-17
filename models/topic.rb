class Topic < ActiveRecord::Base
    has_many :jokes

    # prints list of topics
    def self.print_topics(topic_list)
        topic_list.select do |topic|
            puts "#{topic_list.index(topic) + 1}. #{topic.topic}"
        end
        puts "\n"
    end

    # orders topics by number of jokes associated (descending)
    def self.top_topics
        Topic.all.sort_by { |topic| topic.jokes.length }.reverse!
    end

    # prints top 5 topics by number of jokes associated
    def self.print_top_five_topics
        puts "The top 5 joke topics are:"
        print_topics(top_topics[0..4])
    end
end