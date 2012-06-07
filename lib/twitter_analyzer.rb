require 'twitter'
require 'ruby-debug'

class WordCounter
  attr_reader :word_list

  def initialize
    @word_list = Hash.new()
  end

  def add_word(incoming_word)
    @word_list.fetch(incoming_word) do |new_word|
      @word_list[new_word] = 0
    end
    @word_list[incoming_word] += 1
  end

  def all_words
    a = @word_list.sort_by {|k,v| v}.reverse
    @word_list = Hash[*a.flatten]
    @word_list.keys
  end

end

class TwitterWrapper
  def initialize(user_name)
    @tweets = Twitter.user_timeline(user_name, :count => 200)
    begin
      tweets = Twitter.user_timeline(user_name, :count => 200, :max_id => @tweets.last.id - 1)
      @tweets.concat tweets
    end until @tweets.size > 1000 or tweets.size == 0 
  end

  def tweets
    @tweets
  end

  def latest_tweets(params={:count => 10})
    if(@tweets.size < params[:count])
      return @tweets.slice(0..@tweets.size - 1)
    else
      return @tweets.slice(0..params[:count] - 1)
    end
  end
end


class TweetArrayParser
  attr_accessor :tweet_array
  def initialize(array)
    @tweet_array = array
  end

  def tweet_text
    just_tweet_text = ""
    @tweet_array.each do |tweet|
      just_tweet_text.concat(" " + tweet.text.to_s)
    end
    just_tweet_text
  end

  def tweet_word_array
    self.tweet_text.split(/[\s,]+/)
  end

end
