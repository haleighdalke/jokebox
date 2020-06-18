class Topic < ActiveRecord::Base
    has_many :jokes

    # orders topics by number of jokes associated (descending)
    def self.top_topics
        Topic.all.sort_by { |topic| topic.jokes.length }.reverse!
    end

    # prints top 5 topics by number of jokes associated
    def self.print_top_five_topics
        puts "The 5 most popular topics are:"
        Topic.top_five_topics.select do |topic|
            puts "- #{topic.topic}"
        end
        puts "\n"
    end

    # returns top 5 topics
    def self.top_five_topics
        Topic.top_topics[0..4]
    end
end