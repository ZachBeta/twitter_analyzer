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
      @user = 'zachmorek'
      @tw = TwitterWrapper.new
    end
    it "should grab tweets for a user" do
      @tw.latest_tweets(@user)
      @tw.tweets.first.from_user.should == @user
      @tw.tweets.size.should == 10
    end
    it "should grab an arbitrary number of latest tweets for a user" do
      @tw.latest_tweets(@user, {:count => 5})
      @tw.tweets.size.should == 5
      @tw.latest_tweets(@user, {:count => 50})
      @tw.tweets.size.should == 50
      @tw.latest_tweets(@user, {:count => 500})
      @tw.tweets.size.should == 500
    end
    it "should return x number of tweets for a user" do
      @tw.latest_tweets(@user, {:count => 50})
      @tw.tweets.size == 50
    end
    it "should return x number of unique tweets for a user" do
      tweet_ids = []
      @tw.latest_tweets(@user, {:count => 500})
      @tw.tweets.each do |tweet|
        tweet_ids << tweet.id
      end
      tweet_ids.uniq.length.should == tweet_ids.length
      tweet_ids.uniq.length.should == 500
    end
  end

  describe "Tweet Array Parser" do
    before :each do
      tweet_array = []
      tweet_array << Twitter::Status.new(:full_text => "hello world")
      tweet_array << Twitter::Status.new(:full_text => "hello everone, and world")
      tweet_array << Twitter::Status.new(:full_text => "hi world")
      @tap = TweetArrayParser.new(tweet_array)
    end
    it "should take an array initializer" do
      tweet_array = []
      tweet_array << Twitter::Status.new(:full_text => "hello world")
      tweet_array << Twitter::Status.new(:full_text => "hello everone, and world")
      tweet_array << Twitter::Status.new(:full_text => "hi world")
      @tap.tweet_array.should == tweet_array
    end
    it "should flatten the array" do
      @tap.flat_array.is_a?(Array).should be_true
    end
    it "should take that result and parse it" 
    it "should output those results" 
  end

  describe "The actual twitter_analyzer" do
    it "should take grab tweets"
    it "should parse those tweets"
    it "should count the words"
    it "should bake a mean banana bread"
  end
end
