
require "./retriever/imdb_retriever"

describe ImdbRetriever do
  before do
    @retriever = ImdbRetriever.new
  end
  describe "#get_serie" do
    it "should get a serie when provided a proper title" do
      expect(@retriever.get_serie("breaking bad").title).to eq("\"Breaking Bad\"")
    end

    it "should return nil when no serie found" do
        expect(@retriever.get_serie("uesteibar rules")).to eq(nil)
    end

    it "should return nil when provided a nil title" do
        expect(@retriever.get_serie(nil)).to eq(nil)
    end
  end

  describe "#get_many_series" do
    before do
      @series = @retriever.get_many_series(
        ["V",
        "breaking bad",
        "Heroes"])
    end
    
    it "should get an array of series when provided many proper titles" do
      expect(@series[0].title).to eq("\"V\"")

      expect(@series[1].title).to eq("\"Breaking Bad\"")

      expect(@series[2].title).to eq("\"Heroes\"")

    end

    it "should get an array of series with only the series found" do
      expect(@retriever.get_many_series(
        ["asdfdaafweafewafawefa",
        "breaking bad",
        "IT Crowd"]).size).to eq(2)
    end
  end

end
