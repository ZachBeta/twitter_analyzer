require 'spec_helper'
module TwitterAnalyzerSpec
  describe "When called" do
    before(:each) do
      @wc = WordCounter.new
    end
    it "should return an empty word list after init" do
      @wc.word_list.should be_true
    end
    it "should add new words" do
    end
      
  end
end
