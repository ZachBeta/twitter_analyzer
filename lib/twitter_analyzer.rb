class WordCounter
  attr_reader :word_list

  def initialize
    @word_list = Hash.new()
  end

  def add_word(new_word)
    @word_list[new_word] = 1
  end

end
