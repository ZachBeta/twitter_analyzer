require 'spec_helper'
module TwitterAnalyzerSpec
  describe "When called" do
    it "should return an empty word list after init" do
      WordCounter.new.word_list.should be_true
    end
  end
end
