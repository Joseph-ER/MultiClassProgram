class Diary
  def initialize
    @diary_entries = []

  end

  def add(entry) # entry is an instance of DiaryEntry 
    @diary_entries.push(entry)

  end

  def all
    # Returns a list of instances of DiaryEntry
    @diary_entries
  end

  def count_words
    counter = 0
    @diary_entries.each do |entry|
      counter += entry.count_words
    end
    return counter
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
      return count_words / wpm

  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # @diary_entries  = ["Hello","Hello World", "Hello World 123"]
    # wpm = 2 
    # minutes = 1
    # read_time = 2
    read_time = wpm * minutes
    readable_entries = @diary_entries.filter do |entry| 
       entry.reading_time(wpm) <= read_time
    end #=> readable_entries = ["Hello", "Hello World"]
    return readable_entries.sort_by{|entry| entry.reading_time(wpm)}[-1]

    




        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

