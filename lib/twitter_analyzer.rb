require 'twitter'

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
  def initialize
    @tweets = []
  end

  def tweets
    @tweets.uniq
  end

  #keeps appending so long as the request is shorter
  def grab_tweets_for(user_name, params={:count => 10})
    #TODO refactor this confusing mess
    if(params[:count] > 200)
      if @tweets.size > 0
        @tweets.concat Twitter.user_timeline(user_name, :count => 200, :max_id => @tweets.last.id)
      else
        @tweets.concat Twitter.user_timeline(user_name, :count => 200)
      end
      grab_tweets_for(user_name, {:count => params[:count] - 200})
    else
      if @tweets.size > 0
        @tweets.concat Twitter.user_timeline(user_name, :count => params[:count], :max_id => @tweets.last.id)
      else
        @tweets.concat Twitter.user_timeline(user_name, :count => params[:count])
      end
    end
  end

  def latest_tweets(user_name, params={:count => 10})
    if(@tweets.uniq.size < params[:count])
      grab_tweets_for(user_name, {:count => params[:count] - @tweets.uniq.size })
    end
    return @tweets.slice(0..params[:count] - 1)
  end
end


class TweetArrayParser
  attr_accessor :tweet_array
  def initialize(array)
    @tweet_array = array
  end

  def flat_array
    just_tweet_text = []
    @tweet_array.each do |tweet|
      just_tweet_text.concat(tweet.full_text)
    end
    just_tweet_text
  end

end
