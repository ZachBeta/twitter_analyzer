require 'spec_helper'
module TwitterAnalyzerSpec
  describe "When called" do
    before(:each) do
      @wc = WordCounter.new
    end
    it "should return an empty word list after init" do
      @wc.word_list.should be_true
      @wc.word_list.size.should == 0
    end
    it "should add new words" do
      @wc.add_word("hello")
      @wc.word_list.size.should == 1
    end
      
  end
end
