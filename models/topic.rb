class Topic < ActiveRecord::Base
    has_many :jokes

    # prints list of topics
    def self.print_topics(topic_list)
        topic_list.select do |topic|
            puts "#{topic_list.index(topic) + 1}. #{topic.topic}"
        end
        puts "\n"
    end

    # prints top 5 topics by number of jokes associated
    def self.top_5_topics
        top_5 = Topic.all.sort_by { |topic| topic.jokes.length }.reverse!
        puts "The top 5 joke topics are:"
        print_topics(top_5[0..4])
    end
end