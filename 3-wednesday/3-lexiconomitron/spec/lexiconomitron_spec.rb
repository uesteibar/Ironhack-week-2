
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
  end

  describe "#oompa_loompa" do
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

  describe "#all_in_line" do
    it "should return a string with the provided words sorted by size and delimited by the provided string" do
      expect(@lexiconomitron.all_in_line([
        "words",
        "are",
        "tremendously",
        "nice"], "$")).to eq("remendously$words$nice$are")
    end
  end

  describe "#supercounter" do
    it "should return the number of letters within the array of words that appear before 't' in the alphabet" do
      expect(@lexiconomitron.supercounter([
        "I",
        "am",
        "getting",
        "tired",
        "of",
        "your",
        "words"])).to eq(20)
    end
  end
end
