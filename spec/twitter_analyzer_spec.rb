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
      
  describe "Twitter API" do
    it "should grab tweets for a user" 
    it "should grab the next 'page' of tweets for a user" 
    it "should be able to return multiple 'pages' of tweets for a user" 
    it "should return x number of tweets for a user" 
  end

  describe "Tweet Array Parser" do
    it "should flatten the array" 
    it "should take that result and parse it" 
    it "should output those results" 
  end
end
