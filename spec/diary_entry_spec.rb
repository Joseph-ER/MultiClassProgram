require 'diary_entry'

describe DiaryEntry do
  it "constructs" do  
    diary_entry = DiaryEntry.new("title", "content")
  end 

  it "count words" do
    diary_entry = DiaryEntry.new("title", "this is contents")
    expect(diary_entry.count_words).to eq 3
  end
end