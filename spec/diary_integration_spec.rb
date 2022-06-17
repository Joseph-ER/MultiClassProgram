require 'diary'
require 'diary_entry'

describe 'integration' do
  context "after adding entries "do
    it "lists out all added entries" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("title","content")
      diary.add(diary_entry)
      expect(diary.all).to eq [diary_entry]
    end

    it "counts all words in added entries" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("title ","this is contents")
      diary.add(diary_entry)
      expect(diary.count_words).to eq 3
    end

    it "reading_time method " do
      diary = Diary.new
      diary_entry = DiaryEntry.new("title","this is contents")
      diary.add(diary_entry)
      expect(diary.reading_time(1)).to eq 3
    end

    it "find_best_entry_for_reading_time method" do
      diary = Diary.new
      contents_1 = "this is contents"
      contents_2 = "here's another section of words"
      diary_entry = DiaryEntry.new("title1",contents_1)
      diary.add(diary_entry)
      diary_entry2 = DiaryEntry.new("title2", contents_2)
      diary.add(diary_entry2)
      expect(diary.find_best_entry_for_reading_time(1,4)).to eq diary_entry
    end
  end
end