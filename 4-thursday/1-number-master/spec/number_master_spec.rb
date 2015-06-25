
require "./model/number_master"

describe NumberMaster do
  before do
    @master = NumberMaster.new
  end

  describe "#polarize" do
    it "should return an array with only the positive values " +
    "when most of the provided values are positive" do
      expect(@master.polarize([
        1, 3, -3, 2
        ])).to eq [1, 3, 2]
    end

    it "should return an array with only the negative values " +
    "when most of the provided values are negative" do
      expect(@master.polarize([
        1, -2, -3, -6, 2
        ])).to eq [-2, -3, -6]
    end

    it "should return nil when the provided array contains " +
    "same amount of positive and negative numbers" do
      expect(@master.polarize([1, -1, 2, -2])).to eq nil
    end

    it "should skip values that are not numeric" do
      expect(@master.polarize([
        1, 3, -3, "carrot", 2
        ])).to eq [1, 3, 2]
    end

    it "should return nil when an empty array is provided" do
      expect(@master.polarize([])).to eq nil
    end

    it "should return nil when nil value is provided" do
      expect(@master.polarize(nil)).to eq nil
    end
  end
end
