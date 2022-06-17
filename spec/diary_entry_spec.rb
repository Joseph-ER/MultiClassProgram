require 'diary_entry'

describe DiaryEntry do
  it "constructs" do  
    diary_entry = DiaryEntry.new("title", "content")
  end 

  it "count words" do
    diary_entry = DiaryEntry.new("title", "this is contents")
    expect(diary_entry.count_words).to eq 3
  end

  context "reading_chunk method " do
    it "if contents are readable in the time " do
      diary = DiaryEntry.new("my title", "one two three")
      chunk = diary.reading_chunk(200,1)
      expect(chunk).to eq "one two three"
    end

    it "returns the next chunk, next time we are asked "do
      diary = DiaryEntry.new("my title", "one two three")
      diary.reading_chunk(2,1)
      chunk = diary.reading_chunk(2,1)
      expect(chunk).to eq "three"
    end

    it "restarts after reading the whole contents"do
    diary = DiaryEntry.new("my title", "one two three")
     diary.reading_chunk(2,1)
     diary.reading_chunk(2,1)
     chunk = diary.reading_chunk(2,1)
     expect(chunk).to eq "one two"
    end
    
    it "restarts if it finished exactly on the end " do
      diary = DiaryEntry.new("my title", "one two three")
      diary.reading_chunk(2,1)
      diary.reading_chunk(1,1)
      chunk = diary.reading_chunk(2,1)
      expect(chunk).to eq "one two"
    end
  end

  context "reading_time method " do
    it "calculates reading time based on WPM" do
      diary = DiaryEntry.new("test title ", "word "*400)
      diary.count_words
      expect(diary.reading_time(200)).to eq 2
    end
  end
end