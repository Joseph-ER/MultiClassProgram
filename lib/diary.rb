class Diary
  def initialize
    @diary_entries = []

  end

  def add(entry)
    @diary_entries.push(entry)

  end

  def all
    @diary_entries
  end

  def count_words
    counter = 0
    @diary_entries.each do |entry|
      counter += entry.count_words
    end
    return counter
  end

  def reading_time(wpm)
      return count_words / wpm

  end

  def find_best_entry_for_reading_time(wpm, minutes)
    read_time = wpm * minutes
    readable_entries = @diary_entries.filter do |entry| 
       entry.reading_time(wpm) <= read_time
    end
    return readable_entries.sort_by{|entry| entry.reading_time(wpm)}[-1]
  end
end

