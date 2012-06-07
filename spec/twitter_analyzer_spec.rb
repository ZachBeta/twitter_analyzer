require 'spec_helper'
module TwitterAnalyzerSpec
  describe "WordCounter" do
    before(:each) do
      @wc = WordCounter.new
    end
    it "should not reveal its internal hash"
    it "should return an empty word list after init" do
      @wc.word_list.should be_true
      @wc.word_list.size.should == 0
    end
    it "should add new words" do
      @wc.add_word("hello")
      @wc.word_list.size.should == 1
    end
    it "should add multiple words" do
      @wc.add_word("hello")
      @wc.add_word("world")
      @wc.word_list.size.should == 2
    end
    it "should add one word multiple times" do
      @wc.add_word("hello")
      @wc.add_word("hello")
      @wc.word_list["hello"].should == 2
    end
    it "should return a list of all words sorted desc" do
      @wc.add_word("hello")
      @wc.add_word("hello")
      @wc.add_word("world")
      @wc.all_words.should == ["hello","world"]
    end
    it "should return a list of all words sorted desc 2" do
      @wc.add_word("world")
      @wc.add_word("hello")
      @wc.add_word("hello")
      @wc.all_words.should == ["hello","world"]
    end
  end
      
  describe "Twitter API wrapper" do
    before(:each) do
      @user = 'twitter'
      @tw = TwitterWrapper.new(@user)
    end
    it "should grab an arbitrary number of latest tweets for a user" do
      @tw.latest_tweets({:count => 5}).size.should == 5
      @tw.latest_tweets({:count => 50}).size.should == 50
      #TODO fails and returns some number less than 500... not sure why
      @tw.latest_tweets({:count => 500}).size.should == 500
    end
    it "should return x number of tweets for a user" do
      @tw.latest_tweets({:count => 50})
      @tw.tweets.size.should == 50
    end
    it "should return x number of unique tweets for a user" do
      tweet_ids = []
      tweets = @tw.latest_tweets({:count => 1000})
      tweets.each do |tweet|
        tweet_ids << tweet.id
      end
      tweet_ids.uniq.length.should == tweet_ids.length
      tweet_ids.uniq.length.should == 1000
    end
    it "should failsafe return all the tweets it has" do
      @tw.latest_tweets({:count => 5000 }).size.should == @tw.tweets.size
    end
  end

  describe "Tweet Array Parser" do
    before :each do
      tweet_array = []
      tweet_array << Twitter::Status.new('text' => "hello world")
      tweet_array << Twitter::Status.new('text' => "hello everyone, and world")
      tweet_array << Twitter::Status.new('text' => "hi world")
      @tap = TweetArrayParser.new(tweet_array)
    end
    it "should take an array initializer" do
      tweet_array = []
      tweet_array << Twitter::Status.new('text' => "hello world")
      tweet_array << Twitter::Status.new('text' => "hello everyone, and world")
      tweet_array << Twitter::Status.new('text' => "hi world")
      @tap.tweet_array.should == tweet_array
    end
    it "should flatten the array to a long string" do
      @tap.tweet_text.is_a?(String).should be_true
      @tap.tweet_text.include?("hello").should be_true
    end
    it "should take that result and parse it" do
      @tap.tweet_word_array.is_a?(Array).should be_true
      @tap.tweet_word_array.include?("hello").should be_true
      @tap.tweet_word_array.count("hello").should == 2
    end
  end

  describe "The actual twitter_analyzer" do
    it "should take grab tweets"
    it "should parse those tweets"
    it "should count the words"
    it "should bake a mean banana bread"
  end
end
