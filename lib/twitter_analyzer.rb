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

end
