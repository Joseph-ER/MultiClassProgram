require 'diary'

describe 'diary' do
  it 'constructs' do
    diary = Diary.new
  end
  context 'when constructed' do
    it 'returns an empty list when all is called' do
      diary = Diary.new
      expect(diary.all).to eq []
    end 

  end 


end
