require './lib/twitter_analyzer'

tw = TwitterWrapper.new('twitter')
tap = TweetArrayParser.new(tw.latest_tweets({:count => 1000}))
wc = WordCounter.new
tap.tweet_word_array.each do |word|
  wc.add_word(word)
end
p wc.all_words
