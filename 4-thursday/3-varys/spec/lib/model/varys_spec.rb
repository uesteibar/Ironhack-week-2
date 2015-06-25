
require "./lib/model/varys"

describe Varys do
  before do
    @varys = Varys.new
  end

  describe '#say_my_name!' do
    it 'should say what it is suppossed to say' do
      expect(@varys.say_my_name!).to eq "I am Varys, and I'm here to say what you want to hear."
    end
  end

  describe '#say_cersei_rocks!' do
    it 'should flatter Cersei' do
      expect(@varys.say_cersei_rocks!).to eq "Cersei rocks!"
    end
  end

  describe '#say_joffrey_rocks!' do
    it 'should flatter Joffrey' do
      expect(@varys.say_joffrey_rocks!).to eq "Joffrey rocks!"
    end
  end

  describe '#backwards_wording' do
    it 'should, receiving a list of words, reverse them and return only the ones which have five letters or more' do
      expect(@varys.backwards_wording([
        "hello", "I", "kill", "everybody", "but", "nobody", "knows", "yet"
        ])).to eq ["olleh", "ydobyreve", "ydobon", "swonk"]
    end

    it 'should return an empty array if every word has less than 5 letters' do
      expect(@varys.backwards_wording([
        "I", "kill", "but", "yet"
        ])).to eq []
    end
  end

  describe '#friday_numbers' do
    context 'when it is Friday' do
      it 'should, receiving a list of float numbers, return the ones that are below zero' do
        allow(@varys).to receive(:is_friday?).and_return(true)
        expect(@varys.friday_numbers([
          1.8, 3.2, -10.2, -1, 0
          ])).to eq [-10.2, -1]
      end
    end

    context 'when it is NOT Friday' do
      it 'should, receiving a list of float numbers, return the ones that are over or equal 0' do
        allow(@varys).to receive(:is_friday?).and_return(false)
        expect(@varys.friday_numbers([
          1.8, 3.2, -10.2, -1, 0
          ])).to eq [1.8, 3.2, 0]
      end
    end
  end
end
