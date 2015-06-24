
require "./model/series_master"
require "./retriever/imdb_retriever"

describe SeriesMaster do
  before do
    @master = SeriesMaster.new(ImdbRetriever.new)
  end

  describe "#best_serie" do
    it "sould return best serie of all provided" do
      expect(@master.best_serie(
        ["V",
        "breaking bad",
        "IT Crowd"]
        ).title).to eq("Breaking Bad (2008) (TV Series)")
    end

    it "should return nil when no series provided" do
      expect(@master.best_serie([])).to eq(nil)
    end
  end

  describe "#first_chapter" do
    it "should return the first chapter of the given title" do
      expect(@master.first_chapter("breaking bad")).to eq("Pilot")
    end

    it "should return nil when no serie found" do
      expect(@master.first_chapter("asdfasagsafsfadfa")).to eq(nil)
    end

    it "should return nil when nil title provided" do
      expect(@master.first_chapter(nil)).to eq(nil)
    end
  end
end
