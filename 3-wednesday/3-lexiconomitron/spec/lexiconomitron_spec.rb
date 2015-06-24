
require "./model/lexiconomitron"

describe Lexiconomitron do
  before do
    @lexiconomitron = Lexiconomitron.new("t")
  end

  describe "#shazam" do
    it "should reverse and return (without the 't' letter) the first and the last words of an array of word" do
      expect(@lexiconomitron.shazam(
        ["This",
          "is",
          "a",
          "test"])).to eq(["sih", "se"])
    end

    it "should return the words with 3 or less characters (without the 't' letter" do
      expect(@lexiconomitron.oompa_loompa(
        ["if",
          "you",
          "wanna",
          "be",
          "my",
          "lover"])).to eq(["if", "you", "be", "my"])
    end
  end
end
